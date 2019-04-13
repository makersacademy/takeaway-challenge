require_relative 'menu'
require_relative 'order'
require 'time'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def check_menu
    print @menu.list
  end

  def add_to_order(item, quantity)
    @order.add(item, quantity)
  end

  def summary
    @order.summary
  end

  def total
    puts "total - £#{@order.total}"
  end

  def place_order(given_total)
    raise "given total is not correct" if @order.total != given_total

    time = Time.now + 3600
    "Thank you! Your order will be delivered before #{time.hour}:#{time.min}"
  end
end
