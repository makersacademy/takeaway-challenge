require 'Menu'#!/usr/bin/env ruby -wKU

menu = Menu.new
order = Order.new
TexasTacos = Interface.new(menu: menu, order: order)

puts "Your takeaway is available with teh variable TexasTacos"
puts ".show.menu shows you the menu"
puts "add an item to your order by using .order next to your desired item"
puts ".review.order will allos you to review your order"
puts "use .checkout when you are ready to checkout"
puts "--------------------------------------------------------------------"
