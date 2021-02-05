require './lib/menu.rb'

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
end