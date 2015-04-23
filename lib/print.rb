require_relative 'menu'
require_relative 'order'

class Print
  def display_menu menu
    menu_lists = ""
    dish_number = 1
    while dish_number <= menu.length
      dish = menu[dish_number.to_s]['dish']
      price = menu[dish_number.to_s]['price']
      menu_lists += "#{dish_number}. #{dish} - £#{price}"
      dish_number += 1
    end
    p menu_lists
  end

  def display_order order
    order_list = ''
    dish_number = 1
    order.each do |dish, price|
      order_list += "#{dish_number}. #{dish} - £#{price}"
      dish_number += 1
    end
    order_list
  end
end

menu = Menu.new
p menu_list = menu.menu
# order = Order.new
# order_list = order.place_order(2, 4, menu_list)
print = Print.new
print.display_menu menu_list
# print.display_order order_list
