class Order
  attr_reader :ordered

  def initialize(basket)
    @ordered = basket.basket_contents
  end

end
