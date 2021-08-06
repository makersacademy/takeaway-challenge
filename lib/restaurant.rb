require_relative 'order'

class Restaurant
  attr_reader :dishes, :selection

  def initialize
    @name = "New Restaurant"
    @dishes = [
      { dish: "Sushi", price: 7.50 }, 
      { dish: "Burger", price: 6.10 }, 
      { dish: "Fries", price: 3.00 }, 
      { dish: "Noodle Soup", price: 10.00 }, 
      { dish: "Bahn Mi", price: 9.25 }
    ]
    @selection = []
  end

  def select_dish(menu_num)
    # error if no arguments given
    # error if menu_num not on menu
    @selection << dishes[menu_num - 1]
  end

  def place_order
    Order.new(@selection)
  end
end
