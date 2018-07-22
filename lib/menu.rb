#Return all the dishes
#start by returning one dish 
#name and price
require_relative "dish"
class Menu

  attr_reader :dish
  
  def initialize
    @dish = Dish.new
  end
end