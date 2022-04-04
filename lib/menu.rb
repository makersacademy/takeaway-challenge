# Menu class
# initiated with empty list of available dishes
# can add dish to the list of available dishes
# can be asked to view its list of available dishes
# can be asked to select a dish from list and add it to basket

require_relative './dish'
require_relative './basket'

class Menu
  attr_reader :available_dishes, :dish_class, :basket
  
  def initialize(dish_class = Dish, basket = Basket.new)
    @available_dishes = []
    @dish_class = dish_class
    @basket = basket
  end

  def new_dish(name, price)
    @available_dishes << @dish_class.new(name, price)
  end

  def view_menu
    numbering = 0
    @available_dishes.each do |dish|
      numbering += 1
      puts "#{numbering} #{dish.name}: £ #{dish.price}"
    end
  end

  def select_dish(name, number)
    @available_dishes.each do |dish|
      if dish.name == name
        number.times { @basket.add_to_basket(dish) }
      end
    end
    @basket.basket_contents
  end

end
