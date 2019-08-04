require 'order'

class Restaurant

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order(amount)
    @order.checkout
    payment(amount)
    notify(@order.customer_number)
  end

  private

  def notify(number)
    # Sends a text
  end

  def payment(amount)
    woops = "The payment doesn't match the total!"
    raise woops if amount != @order.total_price
    process_payment(amount)
  end

  def process_payment(amount)
    # Take all the monies!
  end
end