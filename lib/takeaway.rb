require './lib/menu.rb'
require './lib/basket.rb'

class Takeaway
  attr_reader :order

  def initialize
    @order = []
    @menu = Menu.new
  end

  def list_of_dishes
    @menu.formatted_menu
  end

  def order_dish(quantity = 1, item)
    quantity.times { @order << @menu.dish(item) }
    @order
  end

  def complete_order
    basket = Basket.new
    "The total cost is £#{basket.price(@order)}"
  end

end
