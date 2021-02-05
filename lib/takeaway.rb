require './lib/menu.rb'
require './lib/basket.rb'

class Takeaway
  attr_reader :order, :menu

  def initialize
    @order = []
    @menu = Menu.new
  end

  def order_dish(quantity = 1, item)
    fail "Sorry, that item is not on the menu" unless on_menu?(item)

    quantity.times { @order << @menu.dish(item) }
    @order
  end

  def complete_order
    basket = Basket.new
    basket.receipt(order)
  end

  private

  def on_menu?(item)
    @menu.dish(item)
  end
end
