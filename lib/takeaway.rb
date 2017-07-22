require_relative 'order'

class Takeaway

attr_reader :order

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu.list
  end

  def view_menu
    p "MA Pizzeria"
    @menu.each { |key, value| p "#{key} - Price: £#{value}" }
  end

  def add_item(item, quantity = 1)
    order.add(item, quantity, @menu[item])
  end

  def finalise_order
    order.complete_order
  end

  def total
    order.total
  end

  def payment(amount)
     amount == order.total ? "Thank you for your payment!" : "You entered the incorrect payment amount"
  end
end
