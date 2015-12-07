require 'rubygems'
require 'twilio-ruby'
require 'yaml'
require_relative 'sms'
require_relative 'menu'

class Order

  AVG_DELIVERY = 600
  AVG_DISH_PREP = 300

  def initialize(menu = Menu)
    @menu_klass = menu
    @menu = @menu_klass.new
    @dishes = []
  end

  def add(dish, qty = 1)
    dish = (@menu.find(dish)).merge(qty: qty)
    "#{qty}x #{dish} added"
    @dishes << dish
  end

  def review
    "Your order: "+print_dishes+". Total price: £"+total_price.to_s
  end

  def place
    sms = Sms.new
    sms.send(delivery_time)
    "Order placed. You will get an SMS with the delivery time soon!"
  end

  private

  def total_price
    @dishes.inject(0) { |sum,dish| sum + (dish[:price] * dish[:qty]) }
  end

  def number_dishes
    @dishes.inject(0) { |sum,dish| sum + dish[:qty] }
  end

  def delivery_time
    prep = (number_dishes * AVG_DISH_PREP)
    Time.now + prep + AVG_DELIVERY
  end

  def print_dishes
    @dishes.map { |dish| "#{dish[:qty]}x #{dish[:name]} £#{dish[:price]}" }.join(", ")
  end

end
