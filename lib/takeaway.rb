require "./lib/order.rb"

class Takeaway
  attr_reader :dishes

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.send :print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    order.total
  end

  private

  attr_reader :menu, :order
end
