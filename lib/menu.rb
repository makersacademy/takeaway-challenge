require_relative 'dish'

class Menu
  
  def initialize
    @menu = [
      new_dish("Cookies & Cream", 5.0),
      new_dish("Chocolate", 4.3),
      new_dish("Vanilla", 4.4),
      new_dish("Chocolate Chip", 5.3),
      new_dish("French Vanilla", 5.1),
      new_dish("Strawberry", 5.0),
      new_dish("Peanut Butter Cup", 5.0),
      new_dish("Cookie Dough", 5.0),
      new_dish("Neapolitan", 4.7),
      new_dish("Rocky Road", 9.0),
      new_dish("Vanilla Bean", 6.0),
      new_dish("Coffee", 3.2),
      new_dish("Chocolate Brownie", 5.0)
    ]
  end
  
  def list
    @menu.each do |dish|
      p "#{(@menu.index(dish) + 1)}) #{dish.name} - #{dish.price}0"
    end
  end
  
  def item(number)
    @menu[number - 1]
  end

  private

  def new_dish(name, price)
    Dish.new(name, price)
  end
end