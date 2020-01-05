require_relative 'order'
require_relative 'text'

class Takeaway
  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def view_menu
    @order.view_menu
  end

  def add(dish, qty = 1)
    fail "Menu item does not exist" if not_available(dish)

    @order.add(dish, qty)
  end

  def view_order
    @order.view_order
  end

  def view_total
    "Total: $ #{@order.total}"
  end

  def submit_order(payment)
    fail "Payment does not match order total" if wrong_amt(payment)

    send_text
  end

  private

  def send_text
    Text.send
  end

  def wrong_amt(payment)
    @order.total != payment
  end

  def not_available(dish)
    !@order.item_available?(dish)
  end

end
