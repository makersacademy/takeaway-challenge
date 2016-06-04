require_relative 'menu'

class Order

  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def add_item(item)
    menu.menu[item]
    order << menu.menu[item]
  end

  def total
    count = 0
    order.each do |order_line|
      order_line.inject do |sum, item|

      end
    end

  end

  def view_order
  end

  private

  attr_reader :menu
end

order = Order.new

order.add_item(1)
order.add_item(2)
p order.total

