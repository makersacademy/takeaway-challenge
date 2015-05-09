require_relative 'order'

class Checkout

  attr_reader :order

  def initialize (order)
    @order = order
  end

  def final_total
    order.dishes.map(&:values).flatten.inject{ |sum, x| sum + x }
  end

  def print_receipt
    receipt = []
    order.dishes.each do |h|
      h.each { |k, v| receipt << "#{k} @ #{v} x #{order.dishes.map(&:keys).flatten.count(k)}" }
    end
    "#{receipt.uniq}; TOTAL: #{final_total}"
  end

end