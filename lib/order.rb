require 'basket'

class Order

  attr_reader :total_price, :correct_total_price

  def place_order
    fail "The sum is not correct" unless @correct_total_price
    # order = [items_and_quantities, total_price]
    "Thanks! Your order is placed and will be delivered."
  end

  def correct_total_price?(total_price, prices_and_quantities_in_basket)
    if total_price == prices_and_quantities_in_basket.map {|k, v| k*v }.inject(:+)
      @correct_total_price = true
    else
      @correct_total_price = false
    end
      #this method effectively checks the total price was correctly calculated
      #by redoing it in a different manner
  end

end
