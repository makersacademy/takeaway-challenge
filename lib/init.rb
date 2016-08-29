require_relative 'selection'
require_relative 'price_calc'
require_relative '../sms'

puts "Welcome to this awesome Takeaway experience"
puts "These are the available dishes #{Menu::MENU}, please make your selection. Return twice to quit"
sel = Selection.new
order = sel.select_items
puts "Would you like to checkout this order? (yes/no)"
choice = gets.chomp.downcase
case choice
when 'yes'
  sel.calc.calculate
  Sms.new.send_sms
  puts "Here is your receipt, expect an order confirmation text message"
  sel.calc.receipt
when 'no'
  puts "Bye!"
end



#ask if they want receipt to check charge
