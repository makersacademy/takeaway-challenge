require_relative 'dish'

class Menu
  
  def initialize
    @menu = [
      Dish.new("Cookies & Cream", 5.0)
    ]
  end
  
  def list
  end
  
  def item(number)
    @menu[number - 1]
  end
end