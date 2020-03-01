require_relative 'menu'
require 'twilio-ruby'
class Order
  attr_reader :order_list
  DEFAULT_NUMBER = 1
  def initialize
    @order_list = []
    @menu = Menu.new
    @menu.show_menu
  end

  def add(dish, number = DEFAULT_NUMBER)
    fail "This item is not on the menu" unless exists?(dish)

    price = @menu.menu[dish]
    number.times { @order_list << { dish => price } }
  end

  def show_order
    @order_list.each do |item|
      item.each { |dish, price| puts "#{dish}: £#{price}" }
    end
  end

  def total
    fail "Your order list is empty" if @order_list.empty?

    value = 0
    @order_list.each do |item|
      item.each { |_dish, price| value += price }
    end
    print "Your total is £#{value}"
  end

  def exists?(dish)
    @menu.menu.include?(dish)
  end

  def checkout
    show_order
    total
  end
  
  def send_message
    account_sid = "xxxxxxx" 
    auth_token = "xxxxxxx"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Your order is on the way and will be delivered at #{Time.now + 3600}",
        to: "xxxxxxx",
        from: "xxxxxxx")
  end

  def place_order
    send_message
  end
end
