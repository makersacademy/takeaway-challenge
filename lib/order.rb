class Order

  def initialize(order_total_klass:)
    @order_totaller = order_total_klass.new
    @order_lines = Hash.new(0)
  end

  def pick(description)
    @menu.choose(description)
  end

  def add(dish, qty)
    @order_lines[dish] += qty
  end

  def order_lines
    @order_lines.dup
  end

  def total
    @order_totaller.calculate(@order_lines)
  end
end
