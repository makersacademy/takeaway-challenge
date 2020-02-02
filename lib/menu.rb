require_relative 'dish'

class Menu
  
  def initialize
    @menu = [
      Dish.new("Cookies & Cream", 5.0),
      Dish.new("Chocolate", 4.3),
      Dish.new("Vanilla", 4.4),
      Dish.new("Chocolate Chip", 5.3),
      Dish.new("French Vanilla", 5.1),
      Dish.new("Strawberry", 5.0),
      Dish.new("Peanut Butter Cup", 5.0),
      Dish.new("Cookie Dough", 5.0),
      Dish.new("Neapolitan", 4.7),
      Dish.new("Rocky Road", 9.0),
      Dish.new("Vanilla Bean", 6.0),
      Dish.new("Coffee", 3.2),
      Dish.new("Chocolate Brownie", 5.0)
    ]
  end
  
  def list
  end
  
  def item(number)
    @menu[number - 1]
  end
end