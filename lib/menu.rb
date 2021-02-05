require 'viewer'
require 'dish'
require 'cart'

class Menu
  attr_reader :dishes
  def initialize(*dishes)
    @dishes = dishes
    @cart = Cart.new
  end

  def view_menu
    Viewer.new.view(@dishes)
  end

  def add_to_order(item)
    fail "item not on menu" unless on_menu?(item)
    
    @cart.receive_item(item)
  end

  def view_cart
    Viewer.new.view(@cart.order)
  end

  def place_order

  end

  private
  def on_menu?(item)
    @dishes.include?(item)
  end
end
