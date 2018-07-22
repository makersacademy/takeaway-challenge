# Return all the dishes
# Start by returning one dish 
# Same and price
# Menu contains dishes and prices
require_relative "dish"
class Menu

  attr_reader :menu

  def initialize
    @menu = []
  end 

  def add_dish(dish_object)
    @dish_object = {dish_object[:name], dish_object[:price]}
    @menu 
  end

end
