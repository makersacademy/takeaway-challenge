require "./lib/order.rb"

class Customer
  attr_reader :order

  def initialize(order = Order)
    @order = order.new
  end

  def view_menu
    @order.view_menu.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish[:dish]}: £#{'%.2f' % dish[:price]}"
    end
  end

  def add_to_order(dish_name, quantity)
    @order.add(dish_name, quantity)
  end

  def place_order(payment)
    @order.place(payment)
  end
end
