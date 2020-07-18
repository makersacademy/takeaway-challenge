require_relative 'takeaway'
require_relative 'time'

class Order

  attr_reader :order_items, :order_total, :menu

  def initialize(menu = Takeaway.new)
    @menu = menu
    @order_items = []
    @order_total = 0
  end

  def add_to_order(item, quantity) # need to add failure if item not available

    fail "Item does not exist" unless @menu.display_menu.include?(item)

    quantity.times do
      @order_items.push(item)
      @order_total += @menu.display_menu[item]
    end

    "#{item} - Qty:#{quantity} added to order" # need to add running total. New hash called subtotal
  end

  def display_order
    "Current order: #{order_items.uniq.map { |x| "#{x} - Qty:#{order_items.count(x)}" }.join(', ')}"
  end

  def display_total
    "Order total: £#{@order_total}" # this will be a sum of the subtotal array
  end

  def place_order(time = Time.new)
    order_time = time.time_in_an_hour
    "Thank you! Your order was placed and will be delivered before #{order_time}"
  end

end
