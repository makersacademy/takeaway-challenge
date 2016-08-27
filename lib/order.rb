require_relative 'menu.rb'

class Order
  attr_reader :order

  def initialize
    @order = {} # structure should be {dish => quantity}
  end

  def add_to_order(dish, quantity)]
    menu = Menu.new

    number_available = menu.

    quantity.times do
    end
    order[dish] = quantity
  end

  def remove_from_order(dish)
    order.delete(dish)
  end

  def order_total
    total = 0
    menu = Menu.new
    order.each do |dish, quantity|
      total += (quantity * menu.dish_price(dish))
    end
    total
  end
end
