require_relative "order.rb"

class Menu
MENU = {Burger: 3, Hotdog: 2}
attr_accessor :menu

  def initialize(order = Order.new, menu = MENU)
    @order = order
    @menu = menu
  end

  def view
    @menu.each { |k,v| puts "#{k} = £#{v}"}
  end

  def choose(dish, qty)
    @order.choose(dish, qty)
  end

  def list
    @order.list
  end

  def order_total
    @order.price
  end

  def place_order
    @order.place
  end
end
