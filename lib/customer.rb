
require_relative 'order'
require_relative 'menu'
require_relative 'twilio_text'


class Customer

include Menu

  attr_reader :order, :twilio_text

  def initialize(order = Order.new, twilio_text = TwilioText.new)
    @order = order
    @twilio_text = twilio_text
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

  def place_order(list, total)
    fail "Order is empty" if list.empty?
    fail "Total is not correct" unless total_correct(total)
    twilio_text.send_text
  end

  def list
     order.dishes
  end
end
