require_relative "dish"

class Order

  def initialize
    @items = []
    @subtotal = 0.0
  end

  def add(dish, quantity)
    quantity.times { items << dish }
  end

  def review
    items.collect do |item|
      "#{item.name} #{"%.2f" % item.price}"
    end
  end

  def total
    items.each do |item|
      @subtotal += item.price
    end
    "%.2f" % @subtotal
  end

  private
  attr_reader :items

end
