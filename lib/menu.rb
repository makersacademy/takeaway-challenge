# this class returns readable list of dishes and allows for placing an order
require_relative 'dish'
require_relative 'order'

class Menu

  attr_reader :list_of_dishes, :new_order

  def initialize
    @list_of_dishes = []
    @new_order = []
  end

  def add_dish(name, price, dish_class = Dish)
    @list_of_dishes << dish_class.new(name, price)
  end

  def show_menu
    list_of_dishes.each_with_index.map { |dish, index| "#{index + 1}. #{dish.menu_readable}" }.join("\n")
  end

  def add_to_order(index, quantity)
    selected_dish = list_of_dishes[index-1]
    @new_order << { dish: selected_dish.name, quantity: quantity, price: (quantity*selected_dish.price) }
  end

  def place_order(order_class = Order)
    order_class.new(new_order)
  end
end
