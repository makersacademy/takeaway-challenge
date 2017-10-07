class Order
  DELIVERY_TIME = 60 * 60
  def initialize(basket, time = Time.new)
    @order_time = time
    @basket = basket
  end
  
end