class Order

  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add_to_basket(item, price, quantity)
    self.basket << item << price << quantity
  end

end
