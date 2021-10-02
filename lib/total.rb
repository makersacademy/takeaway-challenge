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

  def pay
    checkout.place_order
  end
end
