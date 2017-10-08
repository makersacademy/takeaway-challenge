require 'basket'

class Order

  def place_order(items_and_quantities, total_price)
    fail "The sum is not correct" unless correct_total_price?
  end

  def correct_total_price?(total_price, prices_and_quantities_in_basket)
    total_price == prices_and_quantities_in_basket.map {|k, v| k*v }.inject(:+)
      #this method effectively checks the total price was correctly calculated
      #by redoing it in a different manner
  end

end
