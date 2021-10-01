require_relative 'Order'

class Start
  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def self.ordering
    order = Order.new
    order.menu.display_menu
    order.options
  end
end