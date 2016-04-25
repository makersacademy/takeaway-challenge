require_relative 'takeaway'
require_relative 'twiliomessenger'

class Customer

  attr_reader :order_history, :current_order

  def initialize(name:, number:, messenger: TwilioMessenger.new)
    @name = name
    @number = number
    @current_order = nil
    @order_history = []
    @messenger = messenger
  end

  def begin_order(order = TakeAway.new(menu))
    self.current_order = order
  end

  def place_order(payment)
    fail 'Payment does not match order total!' unless payment_correct?(payment)
    send_message
    archive_order
  end

  private

  attr_reader :number, :messenger

  attr_writer :current_order

  def payment_correct?(payment)
    payment == current_order.order_total
  end

  def archive_order
    order_history << current_order
    self.current_order = nil
  end

  def send_message
    messenger.send_message(number)
  end

end