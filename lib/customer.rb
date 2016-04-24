require_relative 'takeaway'
require_relative 'message'

class Customer

  def initialize(takeaway)
    @takeaway = takeaway
  end

  def checkout(amount, message_class = Message)
    fail "You have not paid the correct amount, please try again" unless payment_correct?(amount)
    message_class.new.send
  end

  private

  def payment_correct?(amount)
    amount == @takeaway.total_to_pay
  end

end
