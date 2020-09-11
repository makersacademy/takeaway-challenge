class Basket
  attr_accessor  :current_order
  def initialize(order_array = [])
    @current_order = order_array
    @price = 0
  end

  def price_total
    @current_order.each {|order| @price += order[:price]}
  end
end