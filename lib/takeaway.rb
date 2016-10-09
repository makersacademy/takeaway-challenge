require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'

class Takeaway

  Twilio.configure do |config|
    config.account_sid = 'AC0066c66153caa48b9f547044b79eb42c'
    config.auth_token = '13b492bd5fd061e9d852a3f7142784a1'
  end

  attr_reader :menu, :price, :basket, :customer

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Order.new
    @customer = Twilio::REST::Client.new
  end

  def menu
    @menu.read_menu
  end

  def add(dish, quantity)
    check_dishes(dish)
    @basket.add_order(dish, quantity, @menu.dishes[dish])
    return "#{quantity}x #{dish} added to basket."
  end

  def basket_summary
    @basket.order_summary
  end

  def total
    @basket.total_price
  end

  def checkout(total)
    send_message("Thank you! The total cost of your order is £#{total}, it will be delivered in 1 hour.")
    return "Congragulations!, Your order has been confirmed! You will receive an sms shortly."
  end

  private

  def check_dishes(dish)
    raise "Dish not found on menu, please try again." if !@menu.dishes.has_key?(dish)
  end

  def send_message(message)
    @customer.messages.create(
    from: +441704320219,
    to: "+447873596438",
    body: "#{message}"
    )
  end

end
