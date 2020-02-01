require_relative 'cart'
require_relative 'messages'
class TakeAway

  def initialize(cart = Cart.new)
    @cart = cart
  end

  def show_menu
    @cart.menu
  end

  def pay(amount)
    raise("Incorrect £ given") if "Total: £#{amount}" != @cart.total
    finish_order
    return "Payment accepted"
  end

  def finish_order(mess = Messages.new)
    @mess = mess
    @mess.send("Thanks for your order! It will be delivered before #{Time.now.+(3600).strftime('%H:%M')}.")
  end

end
