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
    "#{@current_order.join("\n")}\nYour current order is £#{@total}"
  end
end
