require './lib/order.rb'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

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
 puts "your order amount is: #{order.order_total}"

 text_message = "thank you for your order it will arrive by #{(Time.now + (60*40)).strftime("%H:%M")}, the amount total is #{"£%.2f"%order.collect_amount}"
 puts text_message

 #Twilio message creation

 account_sid = 'AC4de8dd33e2d6ee76b3faf33cb63def35'
 auth_token = '53e0790c0c05a41fdfb74f288bcb9476'

 @client = Twilio::REST::Client.new account_sid, auth_token

 @client.account.messages.create(
 	from: '+441274451660',
 	to: '+447960022719',
 	body: text_message,
 )
 puts 'confirmation text sent'
