###
require_relative 'menu'

class Order

  attr_reader :order_list

  def initialize(menu_instance)
    @order_list = {}
    @menu = menu_instance
  end

  def add(item, quantity)
    @order_list[item] = quantity
  end

  def calculate_total
    @order_list.map { |item, quantity| @menu.items[item] * quantity}.inject(:+)
  end

  def order_list_formatted
    @order_list.map { |item, quantity| "#{quantity} #{item}s"}.join(", ")
  end

  def calculate_time
    require 'date'
    Time.now
    #add 30 minutes to the time
  end

  def complete
    "You ordered #{order_list_formatted}. Your total comes to £#{calculate_total}.
    Your order will be delivered at #{calculate_time}"
  end

end

# order = Order.new(Menu.new)
# order.calculate_time
# # order.add("starter",3)
# # order.add("main",5)
# #
# # puts order.complete_order
