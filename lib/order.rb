require_relative '../lib/menu.rb'

class Order
  attr_reader :new_order

  def initialize
    @new_order = []
  end

  def add_dish(dish, count = 1)
    item = {}
    item[dish] = count
    @new_order << item
  end

  def order_total
    total = 0
    @new_order.map { |dishes|
        dishes.map { |dish, count|
            total += dish.price * count
        }
    }
    total
  end

  def place_order
    "Thank you! Your order was placed and will be delivered before 18:52"
  end
end
