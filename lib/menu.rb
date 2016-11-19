require_relative "menu_item.rb"

#Manages the menu items
class Menu

attr_reader :name, :menu_items

  def initialize()
    @menu_items = []
  end

  def add(menu_item)
    menu_items << menu_item
  end

  def delete(menu_item)
    menu_items.delete(menu_item)
  end

  def available_dishes
    menu_items.select {|item| item.available?}
  end

end
