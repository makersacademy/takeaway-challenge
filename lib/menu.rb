require_relative 'dish_printer'

class Menu

  include DishPrinter

  attr_reader :available_dishes, :file

  def initialize
    @available_dishes = [
      { name: "Pizza", price: 9 },
      { name: "Cheeseburger", price: 7 },
      { name: "Steak", price: 12 },
      { name: "Beer", price: 5 }
    ]
  end

  def add_item(dish_name, dish_price)
    available_dishes << { name: dish_name, price: dish_price }
  end
  
  def show
    print_menu(available_dishes)
  end
end
