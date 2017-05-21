require 'restaurant'
require 'menu'
require 'item'
require 'interface'
require 'printer'

class Takeaway

  attr_reader :interface, :restaurant

  def initialize(restaurant_name)
    @restaurant = Restaurant.new(restaurant_name)
    @interface = Interface.new(restaurant)
  end

end
