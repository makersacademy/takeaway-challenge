require_relative 'menu'
require 'twilio-ruby'

class Order
  attr_reader :basket

  def initialize
    @basket = []
    @menu = Menu.new

  end

  def add_to_basket(dish)
    @basket << @menu.dishes[dish]
  end

  def make_selection

    selection = nil

    while selection != "exit\n" do
      puts
      @menu.display
      puts
      puts "Please enter the number of the dish to add."
      puts "Or type exit to escape: "
      selection = gets
      add_to_basket(selection.to_i - 1)
    end

  end

  def show_basket
    price = 0
    puts
    @basket.each do |basket|
      basket.each do |item, value|
        puts "#{item}: £#{value}"
        price += value
      end
    end
    puts "Total price £#{price}"
  end

  def place_order
    time = Time.now.getutc + 60*120

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Your order is confirmed!

    It will arrive at #{time}
    
    ",
    to: ENV["TWILIO_MY_PHONE"],
    from: ENV["TWILIO_MAGIC_PHONE"])
    puts message.sid
  end

end