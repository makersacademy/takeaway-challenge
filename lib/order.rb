
class OrderTotalError < StandardError; end

# This will be populated with the customer's menu choices and will contain the order total.
class Order
  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
    @printer = Printer.new
    @messenger = Messenger.new
  end

  def add_to_basket(dish, quantity)
    @basket << [dish, quantity]
    "#{quantity} x #{dish.name} has been added to your basket!"
  end

  def calculate_total
    @basket.each { |order_item| @total += (order_item[0].price * order_item[1]) }
  end

  def show_basket
    calculate_total
    @printer.print(self)
    @total = 0
  end

  def finalise(expected_order_total, order_number)
    calculate_total
    raise(OrderTotalError) if expected_order_total != @total
    @messenger.send_confirmation(order_number)
  end

end
