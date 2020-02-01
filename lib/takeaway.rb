require_relative 'cart'

class TakeAway

  def initialize(cart = Cart.new)
    @cart = cart
  end

  def show_menu
    @cart.menu
  end

  def pay(amount)
    raise("Incorrect £ given") if amount != @cart.total
  end

end
