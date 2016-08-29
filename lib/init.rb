require_relative 'selection'
require_relative 'price_calc'
require 'date'
require_relative '../sms'

puts "Welcome to this awesome Takeaway experience"
puts "Here is our Menu"
order = Selection.new.select_items
puts "Would you like to checkout this order? (yes/no)"
choice = gets.chomp.downcase
case choice
when 'yes'
  calc = PriceCalculator.new(order)
  calc.calculate
  Sms.new.send_sms
  puts "Would you like a receipt to check the charge is correct?"
  receipt = gets.chomp.downcase
  case receipt
  when'yes'
    calc.receipt
  end
when 'no'
  puts "Bye!"
end



#ask if they want receipt to check charge
