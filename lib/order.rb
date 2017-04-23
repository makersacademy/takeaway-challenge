require 'menu'

class Order

  attr_reader :order_details

  def initialize(*order)
    @order_details = Hash[*order]
  end

  def pricing
    @order_details.keys.each { |k| @order_details[k] *= 2}
  end

end
