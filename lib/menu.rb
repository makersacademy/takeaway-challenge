require_relative 'pie'
require_relative 'mash'
require_relative 'chips'

class Menu
  def initialize(dishes = {"pie" => Pie, "mash" => Mash, "chips" => Chips})
    @dishes = dishes
    @menu_length = dishes.length
  end

  def view
    number = 0
    @dishes.map { |key, dish|
      number += 1
      "#{number}. #{dish.new.details}"
    }.join("\n")
  end

  def provide_dish(dish)
    check_in_menu(dish)
    get_dish(dish).new
  end

  def provide_price(dish)
    check_in_menu(dish)
    dish = get_dish(dish).new
    dish.price
  end

  private

  def check_in_menu(dish)
    raise "That item isn't an item on the menu" unless @dishes.include?(dish)
  end

  def get_dish(dish)
    @dishes[dish]
  end
end
