require_relative 'menu'
require_relative 'menuprice'

class Order

  include MenuPrice

  attr_reader :order_details

  def initialize(*order, customers_expected_total)
    @order_details = Hash[*order]
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
