require_relative "dish"

class Menu
  attr_reader :dish_list, :basket
  ::DEFAULT_MENU =  [Dish.new("peri-peri nuts", "03.95"),
                    [Dish.new("1/4 peri-peri chicken", "03.95"),
                    [Dish.new("1/2 peri-peri chicken", "07.75"),
                    [Dish.new("5 peri-peri chicken wings", "06.75"),
                    [Dish.new("chicken pitta", "06.95"),
                    [Dish.new("chicken wrap", "06.75"),
                    [Dish.new("peri-peri nuts", "03.95")]

  def initialize(list = DEFAULT_MENU)
    @dish_list = list
  end

  def view_menu
    greeting
    menu_formatting(@dish_list)
    selection_instructions
  end

  private

  def greeting
    puts "Welcome to Nandos, here's our menu"
  end

  def menu_formatting(this_menu)
    this_menu.map { |dish|
      puts "#{this_menu.index(dish) + 1}. #{dish.name} for $#{dish.price}"
    }
  end

  def selection_instructions
    puts "Add your selection to your basket, by entering the item's number."
  end
end