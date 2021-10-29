require './lib/menu'

class TakeAway

attr_reader :menu, :dishes, :basket

def initialize
  @menu = menu
  @dishes = dishes
  @basket= []
end

def order(dish, quantity = 1)
#       # fail "no dish" unless dish_available?
 @basket << (dish, quantity)
end


#   end
#   def add_dishes(dishes)
#     dishes.each do |dish, quantity|
#       order.add(dish, quantity)
#     end
end
