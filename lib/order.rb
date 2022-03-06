require_relative 'menu'
require 'twilio-ruby'

class Order
NOT_ON_MENU_ERROR = 'This is not on the menu'

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def select_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR unless available?(item)
    quantity.times { @basket[item] += @menu.dishes[item] }
  end

  def remove_dish(item, quantity = 1)
    fail NOT_ON_MENU_ERROR unless available?(item)
    quantity.times { @basket[item] -= @menu.dishes[item] }
  end

  def checkout
    bill
    puts '*************'
    puts "Your total is #{calculate_total}"
    send_sms
  end

  private

  def bill
    @basket.each { |dish, price| puts "#{dish}: #{price}"}
  end

  def calculate_total
    @basket.values.reduce(:+)
  end

  def available?(item)
    @menu.dishes.has_key?(item)
  end

  def client
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_sms
    arrival_time = (Time.now + 60*60).strftime("%H:%M")

    client.messages.create(
      from: +16626678674,
      to: ENV["PHONE"],
      body: "Thank you! Your order was placed and will arrive by #{arrival_time}"
    )
    # puts message.sid
  end
end
