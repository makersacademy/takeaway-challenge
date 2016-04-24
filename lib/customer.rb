require_relative 'takeaway'
require_relative 'message'

class Customer

  def initialize(takeaway, message_class = Message)
    @takeaway = takeaway
    @message_class = message_class
  end

  def checkout(amount)
    fail "Incorrect amount, please try again" unless payment_correct?(amount)
    send_text
  end

  private

  def payment_correct?(amount)
    amount == @takeaway.total_to_pay
  end

  def send_text
    @message_class.new.send
  end

end
