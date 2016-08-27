require_relative 'selection'
require_relative 'price_calc'
require 'date'

puts "Welcome to this awesome Takeaway experience"
puts "Here is our Menu"
order = Selection.new.select_items
puts "Would you like to checkout this order? (yes/no)"
choice = gets.chomp.downcase
case choice
when 'yes'
  calc = PriceCalculator.new(order)
  calc.calculate
  puts "Order successfully placed! Expect delivery before #{Time.now + 1*60**2}"
  puts "Would you like a receipt to check the charge is correct?"
  receipt = gets.chomp.downcase
  case receipt
  when'yes'
    calc.receipt
  end
when 'no'
  puts "Welcome to this awesome Takeaway experience"
  puts "Here is our Menu"
  order = Selection.new.select_items
end



#ask if they want receipt to check charge
