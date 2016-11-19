#Allows meals to be made and added to menu.


require_relative 'takeaway.rb'

class Menu

  attr_accessor :menu_list, :meal_description

  def initialize
    @menu_list = []
  end

  def add_meal(meal, price)
    @meal = meal
    @price = price
    @meal_description = {:meal => @meal, :price => @price}
    menu_list << @meal_description
  end

  def menu
    self.menu_list
  end



end
