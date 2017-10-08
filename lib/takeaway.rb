require_relative './order'

class Takeaway
  attr_reader :order

  def initialize
    @order = {}
  end

  def add(item)
    item = item.to_sym
    calculate_dishes(item)
    item
  end

  def view_basket
    process_order = Order.new(order)
    process_order.calculate_total
    @basket = process_order.basket
    puts @basket
  end

  def complete_order
    puts "Thanks. You should receive a text shortly to confirm delivery time."
  end

private

  def calculate_dishes(item)
     order[item] == nil ? order[item] = 1 : order[item] += 1
  end

end
