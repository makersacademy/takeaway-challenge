
class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_dish(dish, price)
    @basket << { dish => price }
  end

  def total
    order_total = 0

    @basket.each do |item|
      order_total += item.values[0]
    end
    order_total
  end

  def show_basket
    raise "Empty basket" if @basket.count.zero?
  end
end
