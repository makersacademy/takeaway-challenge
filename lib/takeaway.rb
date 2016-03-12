class Takeaway
  attr_reader :menu

  def initialize(menu, messager = Messager)
    @menu = menu
    @messager = messager
  end

  def calculate_price(order)
    order.inject(0) do |sum, item|
      name = item[0]
      quantity = item[1]
      sum + menu.price_of(name) * quantity
    end
  end

  def receive_order(order, payment)
    fail 'Cannot process an empty order' if order.empty?
    validate_order_items(order)
    validate_payment(order, payment)
    messager.send_message(order.customer.phone, create_message)
  end

  private

  attr_reader :messager

  def validate_order_items(order)
    order.each do |name, quantity|
      fail "#{name} is not on the menu" unless menu.include? name
    end
  end

  def validate_payment(order, payment)
    price = calculate_price(order)
    fail "Incorrect payment: the order total is £%.2f" % price unless payment == price
  end

  def create_message
    "Thank you! Your order was placed and will be delivered before #{time_in_one_hour.strftime('%k:%M')}"
  end

  def time_in_one_hour
    Time.now + 60 * 60
  end
end
