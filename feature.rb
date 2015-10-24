require './lib/order.rb'

new_menu = Menu.new
puts new_menu.menu
puts 'What would you like to order?'

menu_item = gets.chomp

puts 'How many of those would you like?'
