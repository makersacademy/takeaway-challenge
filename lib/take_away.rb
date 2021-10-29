require './lib/menu'

class TakeAway

attr_reader :menu, :dishes, :basket

def initialize
  @menu = menu
  @dishes = dishes
  @basket = []
end

def order(item, quantity = 1)
  choice = [item] * quantity.to_i
  @basket << choice
end


#   end
#   def add_dishes(dishes)
#     dishes.each do |dish, quantity|
#       order.add(dish, quantity)
#     end
end
