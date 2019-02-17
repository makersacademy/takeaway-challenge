class Submission
  def initialize(order = Order.new)
    @order = order

    error_message = "Add items to order first. Cannot submit empty order."
    raise error_message if order.total == 0
  end


end