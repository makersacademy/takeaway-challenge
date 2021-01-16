require_relative 'menu'
require_relative 'restaurant'

class Order

  attr_reader :order, :menu

  def initialize
    @order = []
    @menu = Menu::MENU
  end

  def add_to_order(new_order, quantity = 1)
    fail "This item is not an the menu!" unless dish?(new_order)
    @order << new_order
    
  end

  def price_of_order

  end

  private

  def dish?(dish)
    @menu[dish]
  end

end
