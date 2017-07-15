class Takeaway
  attr_reader :menu, :total_order, :charge

  def initialize
    @menu = menu
    @charge = charge
    @total_order = {}
  end

  def menu
    @menu = { pizza: 8, rice: 7 }
  end

  def menu?
    @menu.size >= 1
  end

  def print_menu
    @menu.map { |item, value| "#{item} is #{value.to_f}" }.join(", ")
  end

  def place_order(order)
    @total_order = order.current_orders
  end

  def calculate_total
    @charge = calculate(@total_order)
  end

  def verify_order(order)
    @charge == order.current_value
  end

private
  def calculate(item)
    item.values.map { |each_order| each_order.inject(:*) }.map.inject(:+)
  end

end
