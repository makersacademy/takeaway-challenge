require_relative 'menu'
require_relative 'order'

class Takeaway  
  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    @menu.show
  end

  def order(list, customer_number)
    @order.add(list, customer_number)
  end

  private

  def price(dish)
    @menu.menu[dish.to_sym]
  end

  def print_price_with(dish)
    puts dish.capitalize + ': £' + price(dish).to_s
  end

  def print(total)
    puts "Total: £#{total}"
  end
end
