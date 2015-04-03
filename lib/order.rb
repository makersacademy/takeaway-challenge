class Order
  attr_accessor :order_list
  def initialize(restaurant)
    @restaurant = restaurant
    @order_list = {}
  end

  def place_order(hash, total)
    correct_total?(hash, total) ? total.to_f : fail('Wrong total')
  end

  def correct_total?(hash, total)
    temp = 0.0
    hash.each_pair do |key, value|
      temp += (@restaurant.dishes[key].to_f * value.to_i)
    end
    total.to_f == temp.to_f
  end
end
