# require_relative 'order_item'
# class Order
#   attr_reader :order_list
#   def initialize
#     @order_list = []
#   end
#
#   def add_dish(dish)
#     dish_already_added ? update_item(dish) : add_new_item(dish)
#     item = OrderItem.new(dish)
#     @order_list << item
#     item
#   end
#
#   def dish_already_added?(dish)
#     order_list.include dish
#   end
# end
