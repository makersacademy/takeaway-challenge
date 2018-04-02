require 'rubygems'
require 'dotenv/load'
require 'twilio-ruby'

class Restaurant
  attr_reader :basket, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @bill = [0]
  end

  def order(name, quantity = 1)
    raise 'Not on the menu!' unless menu.dishes.key?(name)
    basket << (menu.dishes.assoc name) * quantity
    @bill << menu.dishes[name] * quantity
    "#{quantity}x #{name} added to the basket, total: £#{total}"
  end

  def todays_menu
    menu.dishes.each { |dish| puts dish }
    "So... What would you like? It is all fairly fresh"
  end

  def basket_summary
    basket.each { |order| puts order }
    p "Total: #{total}"
  end

  def total
    @bill.sum
  end

  def checkout(expect_total)
    error_message = "Hey! - order something first"
    raise error_message if basket.length.zero?
    error = "Hey it is #{total} not #{expect_total}"
    raise error if expect_total != total
    message = "Your order is complete and will arrive at #{(Time.new + 3600).strftime("%H:%M:%S")}, prepare £#{total} to pay the driver"
    send_text(message)
    @bill = [0]
    @basket = []
    "Enjoy your meal!"
  end

  private

  def send_text(message)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token

    from = ENV['MY_TWILO_NUMBER']
    to = ENV['CLIENT_NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: message
      )
  end
end
