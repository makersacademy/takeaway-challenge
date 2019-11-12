require './lib/order'

class Takeaway

  MENU = { "Margherita" => 8.95, "Hawaiian" => 9.95, "Vegetarian" => 9.95,
    "Pepperoni" => 10.95, "BBQ Chicken" => 10.95,
    "Coke" => 1.95, "Diet Coke" => 1.85, "Water" => 1.00 }

  attr_reader :new_order

  def start_order(order = Order.new)
    @new_order = order
    puts "Use new_order.add to add to your order."
  end
end
