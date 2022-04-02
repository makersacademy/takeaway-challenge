require_relative 'menu'

class Order
  attr_reader :order

  def initialize(menu = Menu.new)
    @order = Hash.new{0}
    @menu = menu
  end

  def menu
    @menu.menu
  end

  def add_to_order(item_index,quantity)
    @order[menu.keys[item_index]] = quantity
  end

  def place_order

  end

  def receipt

  end
end
