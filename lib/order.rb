require_relative 'menu'

class Order
  attr_reader :total
  attr_reader :final_order
  attr_reader :text

  def initialize
    @total = 0
    @final_order = []
  end

  def total_order
    fail "basket empty" if @final_order.empty?
    @final_order.each do |item|
      item.each { |_, price| @total += price }
    end
  end

end
