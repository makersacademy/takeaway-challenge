require_relative 'menu'
require_relative 'order'

class Print
  def display_menu menu
    dish_number = 1
    while dish_number <= menu.length
      dish = menu[dish_number.to_s]['dish']
      price = menu[dish_number.to_s]['price']
      puts "#{dish_number}. #{dish} - £#{price}"
      dish_number += 1
    end
  end

  def display_order order
    dish_number = 1
    order.each do |dish, price|
      puts "#{dish_number}. #{dish} - £#{price}"
      dish_number += 1
    end
  end

menu = Menu.new
menu_list = menu.menu
order = Order.new
order_list = order.place_order(2, 4, menu_list)
print = Print.new
print.display_order order_list
