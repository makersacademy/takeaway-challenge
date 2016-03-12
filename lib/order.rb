require_relative 'order_line'

class Order
  attr_reader :total, :items

  def initialize(order_line_class: OrderLine, customer: nil)
    @customer = customer
    @items = []
    @order_line_class = order_line_class
    @total = 0
  end

  def add(dish, qty)
    item = @order_line_class.new(dish: dish, qty: qty)
    @items << item
    @total += item.total
  end

  def finalise
  end
end
