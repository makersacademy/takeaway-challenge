require './lib/order.rb'


@order = Order.new({ tuna: 4, frog: 1, lamb: 2, pork: 3 })
@order.add_item_to_order("tuna", 4)
@order.add_item_to_order("lamb", 4)
@order.check_order
