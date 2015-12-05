class Takeaway
  attr_reader :list, :order, :quantity, :total

  def initialize
    @list = { "Dish 1" => 1.00,
              "Dish 2" => 2.00,
              "Dish 3" => 3.00 }
    @order = []
  end

  def menu
    list
  end

  def choose(dish, quantity=1)
    quantity.times do
      list.select { |k,v| order.push([k, v]) if k == dish }
    end
  end

  def calculate(order)
    calculate_quantities(order)
    calculate_cost(order)
  end

  def place_order(order, quantity, total)
    fail "Wrong total!" if total != calculate_cost(order)
    puts "Your order has been placed!"
  end

  def calculate_quantities(order)
    b = Hash.new(0)
    order.each { |v| b[v] += 1 }
    b.each { |k, v| puts "#{v} x #{k[0]}" }
    @quantity = order.length
  end

  def calculate_cost(order)
    @total = order.inject(0) do |memo, k|
      memo + k[1]
    end
  end

end
