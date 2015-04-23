require_relative 'menu'

class Order
  attr_accessor :order

  def initialize
    @order = {}
  end

  def place_order(*dish_numbers, menu)
    dish_numbers.each do |number|
      return error if number.class != Fixnum
      dish = menu[number.to_s]['dish']
      price = menu[number.to_s]['price']
      order[dish] = price.to_i
    end
    order
  end

  def error
    "Please add the number of the dish instead of the name of the dish"
  end
end

menu = Menu.new
menu_list = menu.menu
order = Order.new
p order.place_order(1,2, menu_list)
# p order.order