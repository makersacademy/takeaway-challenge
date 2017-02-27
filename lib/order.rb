# Allows user to add items they want to order - done
# User can select multiple copies of item - done
# Stores user order - done
# Returns current item total - done
# Generates order number
# Passes complete order to restaurant
require_relative 'restaurant'

class Order
  attr_reader :items

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @items = []
  end

  def selection(food, quantity)
    dish = @restaurant.menu.select do |item|
      item[:food] == food
    end
    @items << { dish: dish[0], quantity: quantity}
  end

  def subtotal
    @items.each do |item|
      puts "#{item[:dish[:food]]} - £#{item[:dish[:price]]} - #{item[:quantity]} "
    end
    "Current total: £#{calculate_total}"
  end

  private

  def calculate_total
    to_calc = items.map do |item|
      (item[:dish][:price].to_i) * item[:quantity]
    end
    to_calc[0]
  end
end
