class Order

  attr_reader :current_order

  def initialize
    @current_order = Hash.new(0)
  end

  def add(order)
    order.each_pair do |item, quantity|
      @current_order[item] += quantity
    end
  end

  def calculate
    receipt = "Receipt"
    total = 0
    @current_order.each_pair do |item, quantity|
      receipt << "\n#{item.id} x #{quantity}: £#{item.price * quantity}"
      total += item.price * quantity
    end
    receipt << "\nTotal: £#{total}"
    receipt
  end

end
