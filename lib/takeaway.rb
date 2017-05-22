require 'restaurant'
require 'menu'
require 'item'
require 'interface'
require 'printer'
require 'cart'
require 'order'

class Takeaway

  attr_reader :interface, :restaurant, :cart, :order

  def initialize(restaurant_name)
    @restaurant = Restaurant.new(restaurant_name)
    @interface = Interface.new(@restaurant)
    @cart = Cart.new
    @order
  end

  def checkout
    @order = Order.new(@cart, @restaurant)
  end

  def confirm
    interface.printer.print_confirmation
  end

end
