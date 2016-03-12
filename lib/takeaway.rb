require 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu  = menu
    @order = order || Order.new
  end

  def show_menu
    menu.show
  end

  def place_order(dishes)
    dishes.each do |item, quantity|
      order.add(item, quantity)
    end
    order.total
  end

end
