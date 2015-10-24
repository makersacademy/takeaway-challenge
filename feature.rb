require './lib/order.rb'

new_menu = Menu.new
puts new_menu.menu
puts 'What would you like to order?'

menu_item = gets.chomp.to_sym

puts 'How many of those would you like?'
item_number = gets.chomp.to_i

order = Order.new
order.start_order(menu_item, item_number)
puts order.current_order

while true
puts 'would you like to order anything else?'
answer = gets.chomp
  if answer.to_s.downcase == "no"
    break
  elsif answer.to_s.downcase == "yes"
    puts 'what would you like?'
      next_food = gets.chomp.to_sym
    puts 'How many?'
      next_number = gets.chomp.to_i
    order.next_item(next_food, next_number)
  else
    puts 'you need to respond yes or no'
  end
end
 puts order.current_order
