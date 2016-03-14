require_relative 'feature_bootstrapper'

puts @shop.list_dishes
puts "\n\n"

@shop.add_dish 1 , 1
@shop.add_dish 3 , 1

puts @shop.show_outstanding_order

puts @shop.checkout 70
