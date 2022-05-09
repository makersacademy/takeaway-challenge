
# DEFAULT_MENU = { "Noodles" => 7.50, "Pizza" => 11.89, "Chicken Curry" => 6.75, "Boiled Rice" => 2.00 }
# class Order
#   attr_accessor :basket
#   def initialize
#     @basket = []
#     @extract = []
#   end

#   def menu_hash(menu = DEFAULT_MENU)
#     @menu = menu
#   end

#   def select(meal, quantity)
#     @meal = meal
#     @quantity = quantity
#     @quantity.times { @basket << @meal }
#     "You've added #{@quantity}X #{@meal}(s) in your basket"
#   end

#   def total_price
#     x = 0
#     loop_num = 1
#     while loop_num <= @basket.count
#       @extract << menu_hash[@basket[x]]
#       x += 1
#       loop_num += 1
#     end
#     "Total price: £#{@extract.sum}"
#   end
# end