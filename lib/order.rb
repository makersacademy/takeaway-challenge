require_relative 'menu'
require 'twilio-ruby'

class Order
  attr_reader :basket

  def initialize
    @basket = []
    @menu = Menu.new
    @total
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
    account_sid = "AC9132f72c39521dc8c32c732807df6236" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "f62a99a685c4bef44d342be3e6a96876"   # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
    body: "Your order is confirmed!

    It will arrive at #{Time.now.getutc + 1}
    
    ",
    to: "+447565608571",    # Replace with your phone number
    from: "+1 812 496 5686")  # Use this Magic Number for creating SMS
    puts message.sid
  end

end