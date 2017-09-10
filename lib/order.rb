require_relative 'twilio'
require_relative 'dish'

class Order

  def initialize(menu)
    @menu = menu
    @order = []
    @order_price = 0
    @order_print = []
  end

  def take_order(dish = gets.chomp)
    while dish.empty? do
      p "please enter your selection."
      dish = gets.chomp
    end

    while !dish.empty? do
      @order << (dish.split(',').map! { |s| s.to_i })
      dish = gets.chomp
    end
  end

  # order = [[dish_number, quantity], [dish_number, quantity]...]
  def place_order(order = @order, total = gets.chomp)
    format_order(order)
    raise "Total is not correct!" if @order_price.to_s != total
#    Twilio.send
  end

  def format_order(order)
    order.each do |dish|
      quantity = dish[1]
      index = dish[0]
      menu_dish = @menu[index]
      dish_name = menu_dish.name
      dish_price = menu_dish.price
      dish_total = (dish_price * quantity)
      @order_print << [dish_name, quantity, dish_total]
      @order_price += dish_total
    end
  end

  def print_order(order = @order_print, price = @order_price)
    p ""
    p "Order placed:"
    order.each do |dish|
      p "#{dish[0]}  x#{dish[1]}  price: £#{dish[2]}"
    end
    p "Total price: £#{price}"
  end
end
