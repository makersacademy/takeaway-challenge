require_relative 'menu'

class Order

  attr_reader :order, :menu
 
  def initialize(menu = nil)
    @menu = Menu.new(menu)
    @order = []
  end

  def display_menu
    @menu.display
  end

  def add_item(item, quantity = 1)
    raise 'This item is not on the menu' if not_on_menu?(item)
    quantity.times { @order << find_item(item) }
  end

  private 

  def not_on_menu?(item)
    @menu.menu.select { |dish, price| dish == item }.length < 1
  end

  def find_item(item)
    @menu.menu.select { |dish, price| dish == item }
  end

end