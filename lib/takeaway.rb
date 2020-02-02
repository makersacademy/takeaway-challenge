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
    raise("Incorrect £ given") if @cart.total != "Total: £#{amount}"

    finish_order
    return "Payment accepted"
  end

  def finish_order(mess = Messages.new)
    time = Time.now.+(3600).strftime('%H:%M')
    @mess = mess
    @mess.send("Thanks for your order! It will be delivered before #{time}.")
  end

end
