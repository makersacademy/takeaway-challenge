class Order

  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add_to_basket(item, quantity)
    self.basket << item << quantity
  end

end
