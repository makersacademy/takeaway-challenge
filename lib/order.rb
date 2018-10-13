class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_to_basket(item, quantity)
    @basket << { item: item, quantity: quantity }
  end

  def add_to_total(price, quantity)
    @total += (price.to_f * quantity.to_f)
  end

  def order_summary
    @basket.map do |order|
      "Item: #{order[:item]}, Quantity: #{order[:quantity]}"
    end.join("\n") << "\nORDER TOTAL: £#{total}"
  end

end
