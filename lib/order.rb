require 'menu'

class Order
  attr_reader :menu
  def initialize
    @current_order = []
    @menu = Menu.new
  end

  def view
    current_order.dup
  end

  def add(menu_item, quantity)
    quantity.times {update_order(menu_item)}
  end

  def current_total
    menu.order_cost(current_order)
  end

  private

  def update_order(menu_item)
    self.current_order = current_order << menu_item
  end

  attr_accessor :current_order
end
