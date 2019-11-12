require './lib/order.rb'

foodlist = [
  Item.new("Beef Burger", 3.25),
  Item.new("Cheese Burger", 4.25),
  Item.new("BBQ Burger", 5.76),
  Item.new("Chicken Burger", 3.76),
  Item.new("Veggie Burger", 4.24),
  Item.new("Vegan Burger", 2.88),
  Item.new("Camel Burger", 8.56),
  Item.new("Buffalo Burger", 7.56)
]

menu = Menu.new

foodlist.each do |item|
  menu.add_item(item)
end

puts menu.view_menu

myorder = Order.new(menu)

puts myorder.on_menu?("Beef Burger")
puts myorder.on_menu?("Mash")
