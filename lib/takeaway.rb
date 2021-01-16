require_relative 'order'


class Takeaway

  attr_reader :menu, :order

  def initialize(menu: Menu.new, order: Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    menu.see_menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add_order(dish, quantity)
    end
  end

  def order_amount
    order.order_total
  end



end
