class Takeaway

  def initialize
    @basket = {}
  end

  def basket
    @basket.dup
  end

  def menu
    {"rice" => 1.49, "pizza" => 3.79, "cheeseburder" => 0.99, "pepsi" => 0.89}
  end

  def add_item(item, quantity = 1)
    fail "Negative or zero quantities not allowed" if quantity <= 0
    @basket[item] = quantity
    "#{quantity}x #{item}(s) added to your basket"
  end

  def basket_summary
    lines = []
    @basket.each do |item, quantity|
      lines << "#{item} x#{quantity} = £#{(menu[item] * quantity).round(2)}"
    end
    lines.join(', ')
  end

  def total
    cost = 0
    @basket.each { |item, quantity| cost += quantity * menu[item] }
    "Total cost: £#{cost.round(2)}"
  end

end
