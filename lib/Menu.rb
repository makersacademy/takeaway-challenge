require 'menu'

class Menu
  attr_reader :food_list, :order
  def initialize
    @order = []
    @chicken = { 'chicken' => 15 }
    @fish = { 'fish' => 10 }
    @veg = { 'veg' => 5 }
  end

  def food_list
    food_list = [@chicken, @fish, @veg]
  end

  def order
    @order.push(food_list[0],food_list[1]) 
  end
end