require_relative 'takeaway'

class Customer

  attr_reader :order_history, :current_order

  def initialize(name, number)
    @name = name
    @number = number
    @current_order = nil
    @order_history = []
  end

  def begin_order(order = TakeAway.new(menu))
    self.current_order = order
  end

  def place_order(payment)
    fail 'Payment does not match order total!' unless payment_correct?(payment)

    archive_order
  end

  private

  attr_writer :current_order

  def payment_correct?(payment)
    payment == current_order.order_total
  end

  def archive_order
    order_history << current_order
    self.current_order = nil
  end

end