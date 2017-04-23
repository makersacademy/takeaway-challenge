require_relative 'order_selection'
require_relative 'menu'

class CheckOut
  attr_reader :the_cart, :total_balance

  def initialize(menu = Menu.new)
    @menu = menu
    @the_cart = Hash.new(0)
    @total_balance = 0
  end

  def balance(cart)
    cart.each {|food| @the_cart[food] += 1}
    @total_balance = @the_cart.map { |k, v| v * @menu.the_menu[:"#{k}"]}.sum
    return "total order: £#{total_balance}"
  end

  def payment
  end

end
