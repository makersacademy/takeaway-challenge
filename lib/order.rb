require_relative 'restaurant'

class Order
  attr_reader :order, :total_sum, :text

  def initialize
    @order = nil
    @total_sum = 0
    @text = nil
  end

end
