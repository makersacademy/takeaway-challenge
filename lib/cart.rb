class Cart

  attr_reader :cart

  def initialize(cart = [])
    @cart = cart
  end

  def add_to_cart(item)
    cart << item
    "1 #{item} added to your cart"
  end

end
