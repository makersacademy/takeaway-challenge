#allows customer to place an order

require './lib/order.rb'
require './lib/sms.rb'
require './lib/menu.rb'
require 'dotenv'
Dotenv.load

class Takeaway

attr_reader :menu, :order, :placed_order, :text

  def initialize(order_klass, sms_klass, menu_klass)
    @menu = menu_klass.new
    @order = order_klass
    @text = sms_klass.new
  end

  def select(dish_number, quantity = 1)
    place_new_order if placed_order == nil
    raise "Sorry, please pick an available dish option (1-8)" if dish(dish_number) == nil
    quantity.times {placed_order.selected_dishes << dish(dish_number)}
  end

  def view_menu
    menu.view_menu
  end

  def dish(dish_number)
    menu.view_menu[dish_number]
  end

  def check_order
    check_for_error
    placed_order.view_order
  end

  def total_cost
    check_for_error
    placed_order.total_cost
  end

  def confirm_order
    check_for_error
    text.send_message
  end

private

  def check_for_error
    raise "No order has been made." if placed_order == nil
  end

  def placed_order
    @placed_order
  end

  def place_new_order
    @placed_order = order.new
  end

end
