# Allows user to create an order, add to their basket, display their basket and display a total price" 
require_relative 'menu'

class Order
  attr_reader :basket_summary

  def initialize
    @basket_summary = Hash.new(0)
    @total = 0
  end

  def add(dish, quantity = 1)
    @basket_summary[dish] += quantity
  end
  
  def total_cost
    @basket_summary.map do |dish|
      @total += dish.price_calc
    end
  end

  def price_calc
    menu = Menu.new
    @basket_summary.each do |food,quantity|
      qty = @basket_summary[food]
      price = menu.price(food)
      cost = price * qty
      cost
    end
  end
# OUTSTANDING - add dishes price calculation (i.e. qty * dish price, per menu class items) 
end

# o = Order.new
# o.add("pizza",3)
# puts o.basket_summary
# o.price_calc