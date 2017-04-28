require_relative 'order.rb'
require_relative 'menu_list.rb'
require 'date'

class TakeAway

  attr_reader :menu, :order

  def initialize
    @menu = MenuList.new
    @order = Order.new
  end

  def print_menu
    menu.print_menu
  end

  def request_order
    x = nil
    STDOUT.puts "Please enter the number for your order, enter 0 to finish the order"
    until x == 0
      x = STDIN.gets.chomp.to_i
      order.basket << {title: menu.get_title(x), price: menu.get_price(x)}
    end
  end

  def check_order
    order.return_foods
  end

  def confirm_order
    x = nil
    puts "Do you want to confirm your order (y/n)?"
    until x == 'n' || x == 'y'
      x = gets.chomp
    end
    if x == 'n'
      order.cancel_order
      puts 'Order canceled'
    end
    if x == 'y'
      puts "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
    end
  end
end
