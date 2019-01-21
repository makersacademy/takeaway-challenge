require_relative 'basket'
require_relative 'sms'

class Order
  def initialize(basket = Basket, sms = Sms)
    @basket = basket.new
  end

  def place_order
    @basket.contents = []

  end
end
