require_relative 'dish'

class Menu

  attr_reader :list

  def initialize
    @list = []
  end

  def add_dish(dish)
    @list << dish
  end

  def print_menu
    @list.each_with_index.map { |dish, menu_number|
      todo_to_string(dish, menu_number + 1)
    }.join("\n")
  end

  def todo_to_string(dish, menu_number)
    name = dish.name
    price = dish.price
    "#{menu_number}. #{name} £#{price}"
  end

end
