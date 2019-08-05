require_relative "item_list.rb"
require_relative "dish.rb"
require 'CSV'
# The menu should hold the 'truth' for the dishes.
class Menu

  include ItemList

  def initialize(menu_file_path = nil, dish_class = Dish)
    @items = []
    @dish_class = dish_class
    load_menu(menu_file_path) if menu_file_path
  end

  # As the object may be referenced elsewhere we want to update it in place.
  # I can't actually change a dishes name  after initialization.
  # only menu can do that?
  # If something changes on the menu is should change elsewhere

  def add_menu_item(dish)
    raise ERR_DUPLICATE_ITEM if item_index(dish)
    add_item(dish)
  end

  def remove_menu_item(dish)
    raise ERR_MISSING_ITEM unless item_index(dish)
    remove_item(dish)
  end

  def alter_menu_item(dish)
    raise ERR_MISSING_ITEM unless item_index(dish)
    alter_item(dish)
  end

  def display
    display_header()
    items.each do |dish|
      display_row(dish.name, dish.cost)
    end
    display_footer()
    return
  end



  private

  def display_header
    puts "- Menu --------------------------"
    puts " Dish Name            |    Price "
    puts "---------------------------------"
  end

  def display_row(name, price)
    puts " %-20s | %8s " % [name, "£" + "%.2f" % price]
  end

  def display_footer
    puts "---------------------------------"
  end

  def load_menu(menu_file_path)
    menu = CSV.open(menu_file_path)
    menu.each do |row|
      add_menu_item(@dish_class.new(row[0],row[1].to_f)) unless row == ""
    end
  end
end
