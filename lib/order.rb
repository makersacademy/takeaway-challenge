require_relative './dish_order'

class Order
  attr_reader :dish_orders

  PRINT_CENTER_LENGTH = 60

  def initialize(dish_orders = [])
    @dish_orders = dish_orders
  end

  def add(dish_order)
    @dish_orders << dish_order
  end

  def total_price
    @dish_orders.reduce(0) { |sum, dish_order|
      sum + dish_order.dish.price * dish_order.count
    }
  end

  def print_order
    puts "Order".center(PRINT_CENTER_LENGTH)
    @dish_orders.each { |dish_order|
      dish_order_total_price = dish_order.count * dish_order.dish.price
      puts "#{dish_order.dish.name}
      #{dish_order.count} *
      #{dish_order.dish.price}
      #{dish_order_total_price}".center(PRINT_CENTER_LENGTH)
    }
    puts "Total: #{total_price}"
  end
end
