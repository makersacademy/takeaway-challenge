require_relative 'take_away'

puts 'Hello! Welcome to the Takeaway App.'
menu = Menu.new
menu.load_menu
take_away = TakeAway.new("Muzzi's Dirty Kebab Shop", menu)
while true do
  take_away.display_menu
  puts 'What would you like to order? Enter the corresponding item number: '
  item = gets.chomp.to_i
  puts 'How many portions of this would you like? Enter a number: '
  quantity = gets.chomp.to_i
  take_away.add_to_basket(item, quantity)
  puts 'Would you like to add another item? y/n '
  continue = gets.chomp
  break if continue == 'n'
end

puts 'All done? Nice.'

while true do
  puts 'How would you like to proceed? '
  puts '1) See the total price of your order',
       '2) Check out',
       '3) Cancel order'
  choice = gets.chomp
  case choice
  when '1'
    take_away.basket_total
  when '2'
    puts 'Enter the exact payment amount to continue: '
    payment = gets.chomp.to_i
    take_away.checkout(payment)
    break
  when '3'
    break
  end
end
puts 'Thank you, come again!'
