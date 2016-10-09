require_relative 'menu'

module Order

include Menu

def total_price
  menu_prices
  @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
end

def menu_prices
  @unit_prices = []
  @menu_choice.each{|item, quantity| @unit_prices << MENU[item] * quantity.to_f}
  @unit_prices
end

def confirm_order
  total_price
  puts "The items ordered are #{@order_list}\n"
  puts "The overall price is £#{@overall_price}0 \n"
  puts "Enter 'yes' if you are happy to proceed"
  answer = gets.chomp
  (answer == "yes" || answer == "Yes") ? payment : return
end

def payment
  puts "Please check and confirm the payment amount:"
  payment = gets.chomp
    if payment.to_f == @overall_price
      send_text
    else puts "Ooops, something has gone wrong. Please enter the correct amount:"
      confirm_order
    end
end
end
