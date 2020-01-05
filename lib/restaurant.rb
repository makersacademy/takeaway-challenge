require_relative 'order'

class Restaurant
attr_reader :basket, :total

  def initialize(order = Order.new)
    @basket = basket
  end

 
end