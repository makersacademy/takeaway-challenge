class Restaurant
  TIME_TO_DELIVER = 3600 #seconds == 1 hour

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def submit_order(price)
    fail "Your basket is empty" if @order.empty?
    fail "Incorrect payment amount" unless @order.correct?(price)
    @order.complete
  end

  private

  def delivery_time
    (Time.now + TIME_TO_DELIVER).strftime("%k:%M")
  end
end