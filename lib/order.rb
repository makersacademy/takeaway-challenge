
class OrderTotalError < StandardError; end

# This will be populated with the customer's menu choices and will contain the order total.
class Order
  attr_reader :items, :total

  @@order_count = 0

  def initialize
    @items = []
    @printer = Printer.new
    @total = 0
    @messenger = Messenger.new
    @@order_count += 1
  end

  def order_number
    @@order_count
  end

  def add_to_order(dish, quantity)
    @items << [dish, quantity]
  end

  def calculate_total
    @items.each { |order_item| @total += (order_item[0].price * order_item[1]) }
  end

  def show_order
    calculate_total
    @printer.print(self)
    @total = 0
  end

  def finalise(expected_order_total)
    calculate_total
    raise(OrderTotalError) if expected_order_total != @total
    @messenger.send_confirmation(order_number)
  end

end
