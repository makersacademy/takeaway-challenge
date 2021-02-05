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

  def view_cart

  end

  def place_order

  end
end
