require_relative './order'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
  end

  def new_order(customer_number, order = Order.new(self, customer_number))
    @order = order
  end

  def place_order(amount)
    @order.checkout
    payment(amount)
    @order.confirm_payment
    notify(@order.customer_number)
    order_summary()
  end

  def order_summary
    summary = ""
    @order.items.list.each { |item, quantity|
      summary << "#{item}(£#{item_price(item)}/each) - x#{quantity} - total: £#{item_price(item) * quantity}\n"
    }
    summary << "TOTAL: £#{order.total_price}"
  end

  private

  def notify(number)
    # Sends a text
  end


  def item_price(item)
    menu.dishes.select { |dish| dish.name == item }.first.price 
  end

  def payment(amount)
    woops = "The payment doesn't match the total!"
    already_paid = "This order has already been paid for."
    raise woops if amount != @order.total_price
    raise already_paid if @order.paid?
    process_payment(amount)
  end

  def process_payment(amount)
    # Take all the monies!
  end
end