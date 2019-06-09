require_relative 'menu'

class Order

  attr_reader :current_order, :total

  def initialize
    @current_order = Array.new(0)
    @total = 0
  end

  def add(dish, quantity)
    quantity.times do
      @current_order << dish
    end
  end

  def add_to_total(quantity, price)
    @total += (quantity * price)
  end

  def print_order
    puts "#{@current_order.join("\n")}\nYour current order is £#{@total}"
  end
end

# current_order = Order.new
# current_order.add("Congee", 1)
# current_order.add_to_total(1, 5)
# current_order.add("Ramen", 1)
# current_order.add_to_total(2, 10)
# current_order.print_order
