class Order
  attr_reader :total, :as_hash

  def initialize order, total
    @total = total
    @as_hash = {}
    order.split(', ').each { |item|
      parse item
    }
  end

  private

  def parse item
      dish = item[/[a-zA-Z].*/]
      quantity = item[/^\d+/].to_i
      as_hash[dish] = quantity
  end
end
