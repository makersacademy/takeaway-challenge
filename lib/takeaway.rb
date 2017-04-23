require_relative "menu"
require_relative "order"

class Takeaway
  attr_reader :menu, :order_system

  def initialize
    @menu = Menu.new
    @order_system = OrderSystem.new(@menu)
  end

  def show_menu
    menu.print_menu
  end

  def order(item, quantity_needed)
    order_system.place_order(item, quantity_needed)
  end

  def show_order
    order_system.order_list.each { |item|  puts "#{item[1][0]} x #{item[0]} £#{item[1][1]}" }
  end

  def show_total
    puts "Total: £#{order_system.total_order}"
  end

  def confirm(amount)
    raise "Order was not placed because doesn't match the total." if order_system.total_order != amount
  end
end
