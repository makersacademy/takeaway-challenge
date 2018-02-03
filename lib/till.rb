class Till

  attr_reader :total

  def initialize
    @total = 0
  end

  def sum(order)
    order.each do |item|
      item.each_value { |price| @total += price }
    end
  end
end
