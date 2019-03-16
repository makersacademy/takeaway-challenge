class Order

  attr_reader :orderlines, :total

  def initialize
    @orderlines = nil
    @total = 0
  end

  def create_order(order_hash)
    @orderlines = order_hash
    calculate_total
  end

 private

  def dish_price(order_hash)
    order_hash[:dish].price
  end

  def dish_number(order_hash)
    order_hash[:number]
  end

  def calculate_total
    cost = 0
    @orderlines.each do |order_hash|
      cost += dish_price(order_hash) * dish_number(order_hash)
    end
    @total = cost
  end
end
