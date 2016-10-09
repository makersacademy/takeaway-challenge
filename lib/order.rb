class Order
  attr_reader :orderlist, :total, :quantity
  attr_accessor :customer_order_sum, :quantity, :price

  def initialize
    @orderlist = []
    @total = 0

  end

  def place_order(order, quantity)
    @orderlist << order
    @quantity = quantity
    get_price(order)
  end

  def get_price(order)
    order_price = @quantity * order[:price]
    calculate_total(order_price)
  end

  def calculate_total(order_price)
    @total += order_price
  end

  def verify_order(customer_order_sum)
    @customer_order_sum = customer_order_sum
  end

  def order_verified?
    customer_order_sum == @total
  end

  def delivery_time
    time_of_order = Time.now
    (time_of_order + 3600).strftime(" %H:%M") #delivery time order time plus 1 hour
  end


end
