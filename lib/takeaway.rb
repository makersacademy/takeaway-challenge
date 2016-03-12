require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(order_class=Order)
    @order = order_class.new
    @basket = []
  end

  def basket
    @basket.dup.freeze
  end

  def place_order(*dishes, given_total)
    @basket = dishes.each { |dish| dish[:price] = @order.price(dish) }
    raise 'Re-calculate the total price' unless given_total == total
    @order.confirm
  end

  def total
    price = 0
    @basket.each {|dish| price += (dish[:amount] * dish[:price])}
    price
  end
end
