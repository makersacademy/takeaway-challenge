require_relative "menu_item.rb"

#Manages the menu items
class Menu

attr_reader :name, :menu_items


DEFAULT_NAME = "Best London Curry House"
  def initialize(name = DEFAULT_NAME)
    @name = name
    @menu_items = []
  end

  def add(menu_item)
    menu_items << menu_item
  end

  def delete(menu_item)
    menu_items.delete(menu_item)
  end

  def available_items
    menu_items.select {|item| item.amount > 0}
  end

end
