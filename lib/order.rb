require 'menu'

class Order

	attr_reader :food_drinks_and_prices, :total_order

def initialize
  @food_drinks_and_prices = []
  @total_order = 0
end

def selection(dish)
	food_drinks_and_prices << dish
end

end