require_relative 'menu'
class Order
  # This class allows you to view and order dishes

  attr_reader :items, :dishes, :total_order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = menu.dishes
    @total_order = []
  end

  def add(item, quantity=1)
    self.total_order += [dishes.select {|k, v| k == item}] * quantity
  end

  def view_dishes
    dishes
  end

  def total_order_cost
    total_order.flat_map(&:values).inject(:+)
  end

  def place_order(cost)
    total_order_cost
    message = "Order total is #{total_order_cost}. You expected #{cost}."
    fail message if cost != total_order_cost
    "Your order has been placed!" 
  end

  private
  attr_writer :dishes, :total_order
end
