require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Takeaway
  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def view_menu
    @menu.all
  end

  def add(dish, qty)
    fail "Menu item does not exist" if not_available(dish)
    @order.add(dish, @menu.dishes[dish], qty)
  end

  def submit_order(payment)
    fail "Payment does not match order total" if wrong_amt(payment)
    @order.item_count
    send_text
    "Total: $ #{@order.total}"
  end

  private

  def send_text
    Text.send
  end

  def wrong_amt(payment)
    @order.total != payment
  end

  def not_available(dish)
    @menu.dishes[dish] == nil
  end


end
