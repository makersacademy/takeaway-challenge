require_relative 'Order'
require_relative 'Dish'

class Takeaway

  attr_reader :dishes

  SET_MENU = [
    { name: "Chicken jalfrezi", price: 8.00 },
    { name: "Lamb bhuna", price: 9.00 },
    { name: "Boiled rice", price: 2.00 },
    { name: "Pilau rice", price: 2.50 },
    { name: "Plain naan", price: 2.50 },
    { name: "Peshwari naan", price: 3.00 },
    { name: "Poppadom", price: 0.50 }
  ]

  def initialize
    @dishes = Array.new
    @orders = Array.new
  end

  def add_dish(name, price)
    @dishes << Dish.new(name, price)
  end

  def populate_menu(menu = SET_MENU)
    menu.each do |dish|
      add_dish(dish[:name], dish[:price])
    end
  end

  def display_dishes
    @dishes.each do |dish|
      puts "#{dish.name}: #{currency(dish.price)}"
    end
  end

  def order(received_order)
    new_order = Order.new(received_order)
    @orders << new_order
    order_success_message(new_order)
  end

  def order_success_message(order)
    time = order.delivery_time.strftime("%k:%M")
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

end

def currency(value, sign = "£")
  "#{sign}#{'%.2f' % value}"
end
