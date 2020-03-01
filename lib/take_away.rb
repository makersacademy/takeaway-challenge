require "order"

class Takeaway

  attr_accessor :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  end
  
  def order_up(dishes)
    dishes.each do |dish, amount|
      order.add(dish, amount)
    end
    order.total
  end
end