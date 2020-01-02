class Order
  def total(basket)
    total = []
    basket.basket.each do |dish|
      total << dish.values
    end
    total.flatten.inject(:+)
  end
end