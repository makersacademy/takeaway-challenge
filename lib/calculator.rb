require_relative 'order'
require_relative 'menu'

class Calculator
  def display_total order
    total_prices = order.values.inject(:+)
    puts "The total of your order is £#{total_prices}"
  end
end

menu = Menu.new
menu_list = menu.menu
order = Order.new
order_list = order.place_order(2, 4, menu_list)
calculator = Calculator.new
calculator.display_total order_list
