require_relative 'menuprice'

class Order

  include MenuPrice

  attr_reader :order_details, :customers_expected_total

  def initialize(order_details, customers_expected_total)
    @order_details = order_details
    @customers_expected_total = customers_expected_total
  end

  def calculated_total
    total = 0
    @order_details.each do |k, v|
    total += (price(k) * v)
    end
    total
  end

end
