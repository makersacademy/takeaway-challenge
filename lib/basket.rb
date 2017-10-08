require 'takeaway_restaurant'

class Basket

  attr_reader :selected_meal, :total_price

  def select_meal(items_and_quantities)
    @selected_meal = items_and_quantities
  end

  def total_order_price(items_and_quantities, dishes)
    prices = dishes.select_prices
    quantities = items_and_quantities.values

    i = 0
    item_prices = []
    while i < prices.length
      item_prices << prices[i] * quantities[i]
      i += 1
    end
    @total_price = item_prices.inject(:+)
    #need to refactor this method
  end

  def select_prices(items_and_quantities, dishes)
    dishes.select {|k, v| items_and_quantities.include?(k)}.values
  end

  def correct_total_price?(dish_prices_and_quantities, dishes)
    @total_price == dish_prices_and_quantities.map {|k, v| k*v }.inject(:+)
      #this method effectively checks the total price was correctly calculated
      #by redoing it in a different manner
  end



end
