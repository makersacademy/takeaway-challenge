class Order
  attr_reader :total, :as_hash

  def initialize(order, total)
    @total = total
    @as_hash = parse order
  end

  private

  def parse order
    order.split(', ').each_with_object({}) do |item, hash|
      hash[item[/[a-zA-Z].*/]] = item[/^\d+/].to_i
    end
  end
end
