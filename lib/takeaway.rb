require './lib/menu.rb'
require './lib/basket.rb'

class Takeaway
  attr_reader :order, :menu

  def initialize
    @order = []
    @menu = Menu.new
  end

  def order_dish(quantity = 1, item)
    fail "Sorry, that item is not on the menu" unless check_item(item)
    
    quantity.times { @order << @menu.dish(item) }
    @order
  end

  def complete_order
    basket = Basket.new
    "The total cost is £#{basket.price(@order)}"
  end

  private

  def check_item(item)
    @menu.dish(item) ? true : false
  end
end
