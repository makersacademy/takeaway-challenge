require_relative 'pie'
require_relative 'mash'
require_relative 'chips'

class Menu
  def initialize(dishes = {1 => Pie, 2 => Mash, 3 => Chips})
    @dishes = dishes
    @menu_length = dishes.length
  end

  def view
    @dishes.map { |number, dish|
      "#{number}. #{dish.new.details}"
    }.join("\n")
  end

  def provide_dish(dish_number)
    check_in_menu(dish_number)
    get_dish(dish_number).new
  end

  private

  def check_in_menu(dish_number)
    raise "That number isn't an item on the menu" unless @dishes.include?(dish_number)
  end

  def get_dish(dish_number)
    @dishes[dish_number]
  end
end
