# Allows user to create an order, add to their basket, display their basket and display a total price" 
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
      @total += dish.dish_cost 
    end
  end

  def dish_quantity
    @basket_summary.each do |food,quantity|
      qty = @basket_summary[food]
      puts qty
    end
end
# add dishes price calculation (i.e. qty * dish price, per menu class items) 
end