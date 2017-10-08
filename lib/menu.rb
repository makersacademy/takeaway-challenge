require './lib/object_list.rb'

class Menu
  attr_reader :menu_items

  def initialize(menu_items = ObjectList.new)
    @menu_items = menu_items
  end

  def add_dish(dish)
    @menu_items.add dish
  end

  def remove_dish(dish)
    @menu_items.remove dish
  end

  def view_menu
    @menu_items.to_string
  end

end
