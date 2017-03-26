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
    fail "Not on menu" unless menu.on_menu?(menu_item)
    quantity.times {update_order(menu_item)}
  end

  def current_total
    total = menu.order_cost(current_order)
  end

  def place_order(cost_confirmation)
    fail "Expected price does not match order price" if expected_order_price_incorrect?(cost_confirmation)
    reset_order
  end

  def reset_order
    self.current_order = []
  end

  def expected_order_price_incorrect?(expected_cost)
    expected_cost != current_total
    
  end

  private

  def update_order(menu_item)
    self.current_order = current_order << menu_item
  end

  attr_accessor :current_order
end
