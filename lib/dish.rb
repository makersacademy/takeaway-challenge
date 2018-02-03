require_relative "menu"

class Dish

  attr_reader :number, :name, :price

  def initialize(dish_number)
    @number = dish_number
    @name = Menu::MENU[dish_number][0]
    @price = Menu::MENU[dish_number][1]
  end

end
