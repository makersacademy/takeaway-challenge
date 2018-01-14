require_relative 'menu'

class Order

  attr_reader  :dish, :quantity, :price
  attr_accessor :total, :order

  def initialize
    @order = order
  end

  def add_to_order(dish, quantity)
    @dish = dish
    @quantity = quantity
    calculate_total
  end

  def calculate_total
    puts "Dish total = #{total = (dish.instance_variable_get(:@price) * quantity)}"
    return total
  end

end
