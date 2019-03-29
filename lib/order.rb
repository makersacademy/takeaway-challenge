require_relative 'food_menu'

class Order
attr_reader :orders

  def initialize
    @orders = []
    @fm = FoodMenu.new
    @showorder = []
  end

  def take_order
  food_number = gets.chomp
    while !food_number.empty? do
      puts "How Many?"
      quantity = gets.chomp
      order_into_hash(food_number, quantity)
      food_number = gets.chomp
    end
  end

  def order_into_hash(food_number, quantity)
    @orders << {food: food_number.to_i, quantity: quantity}
  end

  def show_orders
    @showorder = []
    @orders.each do |y|
      @showorder << ("#{@fm.get_name(y[:food])} x #{y[:quantity]}")
    end
    return @showorder.join(", ")
  end

end
