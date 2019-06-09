class Order
  attr_reader :order
  def initialize
    @order = []
  end

  def add_item(item, qty)
    @order << { item: item, qty: qty }
    "added #{qty} #{item.name}(s)"
  end

  def print_order
    @order.map { |each|
      "#{each[:qty]} - #{each[:item].name}(s)"
    }.join("\n")
  end

  def total
    total = @order.map { |each|
      each[:item].price * each[:qty]
    } .inject(:+)
    "Your total is £#{total}"
  end

end
