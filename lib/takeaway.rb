require 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def view_menu
    menu.view
  end

  def make_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
