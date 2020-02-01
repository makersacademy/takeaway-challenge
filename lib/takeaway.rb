class TakeAway

  attr_reader :cart

  def initialize(cart = [])
    @cart = cart
  end

  def show_menu
    { "burger" => 5, "fries" => 3, "shake" => 2 }
  end

  def add_to_cart(item)
    cart << item
    "1 #{item} added to your cart"
  end

end
