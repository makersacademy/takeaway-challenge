require 'dotenv/load'
require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway  
  def initialize
    @menu = Menu.new
    @order = Order.new
    @sms = Sms.new
  end

  def show_menu
    @menu.show
  end

  def add_to_order(dish)
    @order.add(dish)
  end

  def show_order
    total = 0
    @order.current_order.each do |dish|
      total += price(dish)
      print_price_with(dish)
    end
    print(total)
  end

  def confirm_order
    @sms.send
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
