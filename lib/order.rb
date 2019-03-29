require_relative 'food_menu'

class Order

  def initialize
    @orders = []
    @fm = FoodMenu.new
    @showorder = []
  end

  def take_order
  food_number = STDIN.gets.chomp
    while !food_number.empty? do
      puts "How Many?"
      quantity = STDIN.gets.chomp
      order_into_hash(food_number, quantity)
      food_number = STDIN.gets.chomp
    end
  end

  def order_into_hash(food_number, quantity)
    @orders << {food: food_number, quantity: quantity}
  end

  def show_orders
    @orders.each do |y|
      @showorder << ("#{@fm.get_name(y[:food])} x #{y[:quantity]}")
    end
    return @showorder.join(", ")
  end

end
