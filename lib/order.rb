class Order
  attr_reader :cart

  def initialize
    @cart = {}
  end

  def add_cart(item, qty)
    @cart[item] = qty
  end
end
