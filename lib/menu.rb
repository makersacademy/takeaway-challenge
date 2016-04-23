class Menu

  def initialize
    @menu_items = { 'onion bhaji' => 3.99, 'naan' => 2.99 }
  end

  def show_menu
    @menu_items.dup
  end

end

# require_relative 'dish'

  # def add_to_menu(name, price, dish_class = Dish)
  #   @menu_items << dish_class.new(name, price)
  # end
