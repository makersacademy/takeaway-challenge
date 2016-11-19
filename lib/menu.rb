require_relative 'takeaway.rb'

#Allows meals to be made and added to menu

class menu

  attr_accessor :menu_list

  def initialize
    @menu_list = []
  end

  def add_meal(meal, price)
    @meal = meal
    @price = price
    meal_description = {:meal => @meal, :price => @price}
    @menu_list << meal_description
  end

  def select_meal(dish)
    @menu_list.find {[:meal] == dish}
  end


end
