require_relative 'checkout'

class Total
  attr_reader :selection, :checkout

  def initialize(checkout = Checkout.new)
    @selection = []
    @checkout = checkout
  end

  def bill
    sum = []
    selection.each do |item|
      sum << item[:price].to_f * item[:quantity]
    end
    sum.inject(:+)
  end

  def receipt
    selection
  # not entirely sure what the user story required
  end

  def pay
    checkout.send_notification
  end
end
