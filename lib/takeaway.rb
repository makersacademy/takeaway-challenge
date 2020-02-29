require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu, order = Order.new(menu))
    @order = order
  end

  def print_menu
    @menu.show_menu
  end

  def place_order(dish, quantity)
    @order.adds_item(dish, quantity)
    print_order
    # complete_order()
  end

  def complete_order(price)
    correct_amount?(price) 
  end

  private

  def correct_amount?(price)
    @order.total == price
  end

  def print_order
    puts "Order\n----" 
    @order.order.each do |dish, quantity|
      puts "#{dish}: #{quantity}"
    end
    puts "Total: £#{@order.total}"
  end

end
