require 'restaurant'
require 'menu'
require 'item'
require 'interface'
require 'printer'
require 'cart'

class Takeaway

  attr_reader :interface, :restaurant, :cart

  def initialize(restaurant_name)
    @restaurant = Restaurant.new(restaurant_name)
    @interface = Interface.new(@restaurant)
    @cart = Cart.new
  end

end
