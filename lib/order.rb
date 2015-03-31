class Order
  attr_writer :order
  def initialize(restaurant)
    @restaurant = restaurant
    @order_list = {}
  end

  def place_order(hash)
    hash.each_pair do |key, value|
      @order_list = { key => value }
    end
  end
end
