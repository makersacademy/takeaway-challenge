class Basket
  attr_reader :summary, :prices
  def initialize
    @prices = []
    @summary = []
  end

  def add_summary(dish)
    @summary << dish
  end

  def add_price(price)
    @prices << price
  end

  def price
    @prices.sum
  end

  def is_correct?(amount)
   is_correct_amount?(amount)
  end

 private

 def is_correct_amount?(amount)
    price.to_f == amount
 end
end
