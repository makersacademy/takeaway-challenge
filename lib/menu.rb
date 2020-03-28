require_relative 'pie'
require_relative 'mash'
require_relative 'chips'

class Menu
  def view
    "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
  end

  def provide_dish(dish_number)
    check_in_menu(dish_number)
    get_dish(dish_number).new
  end


  private

  DISHES = {1 => Pie, 2 => Mash, 3 => Chips}
  MENU_LENGTH = DISHES.size

  def check_in_menu(dish_number)
    raise "That number isn't an item on the menu" unless DISHES.include?(dish_number)
  end

  def get_dish(dish_number)
    DISHES[dish_number]
  end
end