require 'order'

class Takeaway

  def initialize(menu:, order: Order.new(menu))
    @menu = menu
    @order = order
  end

  def list_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
  
  private

  attr_reader :menu, :order

end