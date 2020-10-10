require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order 

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def view_menu
    @menu.print_menu
  end

  def add_item(item, quantity = 1)
    @menu.item_available?(item) ? add_to_order(item, quantity) : not_available
  end

  private 

  def add_to_order(item, quantity)
    @order << { item => quantity }
  end

  def not_available
    raise "Please select items from the menu."
  end

end
