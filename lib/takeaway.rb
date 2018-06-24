require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway

  attr_reader :menu, :order, :messenger

  def initialize(menu, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def show_menu
    menu.print_dishes
  end

  def place_order(customer_order)
    customer_order.each do |dish, qty|
      @order.add(dish, qty)
    end
  end

  def total
    order.total
  end

  def basket
    display = []
    order.basket.each do |item, qty|
      display << "#{item.capitalize} #{qty} £#{'%.2f' % (menu.price(item) * qty)}"
    end
    display.join(", ")
  end

  def checkout
    messenger.send(order.total)
    order.total
  end
end
