# this class is responsible for showing a menu, adding dishes with quantitites to an array, calculating the total price of dishes and reseting the ordered dishes array.
require_relative "menu"

class Order

  def initialize(menu = Menu.new)
    @menu = menu
    @added_dishes = []
  end

  def menu
    @menu.dishes
  end

  def add(dish,number)
    raise "The dish is not on the menu." unless menu.include?(dish.to_sym)
    @added_dishes << [dish,number]
  end

  def total
    total = 0
    @added_dishes.each do |element|
      total += element[1] * menu[element[0].to_sym]
    end
    total
  end

  def reset_order
    @added_dishes = []
  end
  
end
