class Order

  attr_reader :order_time, :order_items, :delivery_time, :provided_total, :calculated_total

  TIME_TO_DELIVER = 60 * 60

  def initialize(order, menu)
    @order_time = Time.now
    @order_items = interpret_order(order)
    @calculated_total = total_order(@order_items, menu)
    fail "Wrong total" unless @calculated_total == provided_total
    @delivery_time = @order_time + TIME_TO_DELIVER
  end

  def interpret_order(order)
    lines = order.split(",")
    @provided_total = currency_to_number(lines.pop.strip)
    lines.map do |line|
      item = line.split(" ", 2)
      { name: item[1].strip, quantity: item[0].strip.to_i }
    end
  end

  def total_order(order_items, menu)
    total = 0
    order_items.each do |item|
      price = menu.select { |dish| dish.name == item[:name] }.first.price
      total += price * item[:quantity]
    end
    total
  end
end

def currency_to_number(value)
  value[0].match?(/[[:digit:]]/) ? value.to_f : value[1..-1].to_f
end
