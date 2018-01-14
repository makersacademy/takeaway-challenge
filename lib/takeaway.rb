require_relative "menu"

class Takeaway

  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def add_to_order(item, quantity)
    @order[item].nil? ? @order[item] = quantity : @order[item] += quantity
    "You just added '#{quantity} x #{item}'. Your order so far is: '#{display_order(@order)}'"
  end

  def get_total
    @order.map { |item, quantity| quantity * menu.dishes[item] }.inject(0, :+)
  end

  private

  def display_order(order)
    order.map { |k, v| "#{v} x #{k}" }.join(", ")
  end
end
