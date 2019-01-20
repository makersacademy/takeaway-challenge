require './lib/menu.rb'
require './lib/order.rb'
@ppp_menu = [{:item => "pizza", :price => 10}, {:item => "pasta", :price => 12}, {:item => "pancakes", :price => 6}]
@ppp_cafe = Menu.new(@ppp_menu)
puts "Welcome to PPP Cafe, this is the menu"
@ppp_cafe.list_dishes
puts "what do you want to order?"
@complete_order = Order.new([{:pizza => 2, :pasta => 1}, 3])
puts @complete_order.items
@ppp_cafe.order(@complete_order.items)
puts "your order is complete"
puts "you should recieve a text confirming your order :)"
