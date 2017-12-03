require_relative 'menu'

class Order
   attr_reader :basket, :dishes, :dish_search
   def initialize(menu1 = Menu.new)
       @menu1 = menu1
       @basket = []
   end
   def selection(food)
       raise "Please select from one of the tasty dishes available!" unless @menu1.dish_search.include?(food)
       @basket << food
   end
end
