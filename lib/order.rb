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

  def selection(food, quantity) # Would be better with a key value pair for quantity
    dish = @restaurant.menu.select do |item|
      item[:food] == food
    end
    @items << dish * quantity
    @items.flatten!
  end

  def subtotal
    @items.each do |item|
      "#{item[:food]} - £#{item[:price]}" # Would be better not to duplicate dish
    end
    "Current total: £#{calculate_total}"
  end

  private

  def calculate_total
    to_calc = items.map do |item|
      item[:price].to_i
    end
    to_calc.reduce(:+)
  end
end
