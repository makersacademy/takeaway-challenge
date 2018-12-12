class Order

  attr_reader :order
  def initialize
    @order = {}
  end

  def add(item, quantity, price)
    order[item] = { "quantity" => quantity, "price" => price }
    order
  end

  def total_to_pay
    total = 0
    order.each do |_, value|
      total += value["quantity"] * value["price"]
    end
    total
  end

end
