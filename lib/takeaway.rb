require_relative "menu"

class Takeaway

  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def place_order(*order, total)
    raise "The total is not correct and the order has not been placed!" if total != get_total(order)
    @order = format_order(order)
  end

  def get_total(order)
    format_order(order).map { |item, quantity| quantity * menu.dishes[item] }.inject(0, :+)
  end

  private

  def format_order(order)
    order.each_slice(2).to_a.to_h
  end
end
