require_relative 'menu'
require_relative 'cart'

class Customer

  attr_reader :menu, :cart

  def initialize(menu = Menu.new, cart = Cart.new)
    @menu = menu
    @cart = cart
  end

  def view_menu
    menu.print
  end

  def select_dishes(*args)
    args.each do |arg|
      cart.contents << menu.items[ arg - 1 ]
    end
  end

  private

end
