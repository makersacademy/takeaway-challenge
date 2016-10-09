# require_relative 'menu'
# require_relative 'takeaway'
# require_relative 'price_calculator'
#
#
# module Orders
#
# include Text, PriceCalculator, Menu
#
#
# def order_count
#   @total_count = @menu_choice.values.inject(:+)
# end
#
# def confirm_order
#   total_price
#   puts "The items ordered are #{@order_list}\n"
#   puts "The overall price is £#{@overall_price}0 \n"
#   puts "Enter 'yes' if you are happy to proceed"
#   answer = gets.chomp
#   (answer == "yes" || answer == "Yes") ? payment : return
# end
#
# end
