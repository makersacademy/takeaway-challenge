
require_relative 'order'
require_relative 'menu'
require_relative 'twilio_text'

class Customer

  include Menu
  include TwilioText

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def list_of_dishes
    Menu::MENU
  end

  def add_dish(dish, quantity)
    order.add_dish(dish, quantity)
  end

  def total_correct(total)
    total == order.total
  end

  def place_order(list=my_list, total)
    fail "Order is empty" if list.empty?
    fail "Total is not correct" unless total_correct(total)
    send_text
  end

  def my_list
     order.dishes
  end
end
