class Order
  attr_reader :order, :total

  def initialize
    @order = []
    @total = 0
  end

  def add(item)
    @order << item
  end

  def calculate_total
    order.each do |entry|
      entry.each do |name,price|
        @total += price
      end
    end
  end

end
