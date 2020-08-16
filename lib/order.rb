
class Order

   def initialize
    @total_price = 0
   end

   def sum(food_list)
    food_list.each { |hash| hash.each {|food, price| @total_price += price } }
    @total_price
   end

end