# require 'order'
# require 'menu'

class TakeAway
  attr_reader :menu, :order
  def initialize(menu, order)
    @order = order
    @menu = menu
  end

  def display_menu
    @menu.display_menu
  end

  def receive_order(dishes)
    dishes.each do |dish, quantity|
      order.place_order(dish,quantity)
    end
    order.order_total
  end



end
