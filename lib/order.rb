require_relative 'Menu'

class Order

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = {}
    @menu = menu
  end

  def add(item, quantity)
    order[item] = quantity
    order
  end

  def total_to_pay
    total_per_item = order.map { |item, quantity| menu.display[item] * quantity }
    total_per_item.inject { |item, total| total += item }
  end

end
