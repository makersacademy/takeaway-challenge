require_relative "menu_item.rb"

#Manages the menu items
class Menu

attr_reader :menu_items
attr_accessor :menu_item

  def initialize()
    @menu_items = []
    @menu_item
  end

  def create(name, price, amount, menu_item_klass = MenuItem)
    self.menu_item = menu_item_klass.new(name, price, amount)
    add_to_menu
  end

  def add_to_menu
    menu_items << menu_item
    self.menu_item = nil
  end

  def available_dishes
    menu_items.select {|item| item.available?}
  end



end
