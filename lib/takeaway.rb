require_relative 'messenger'
require_relative 'order'
require_relative 'menu'

class Takeaway
  def initialize(order: Order.new, messenger: Messenger.new, menu: Menu.new)
    @order = order
    @messenger = messenger
    @menu = menu
  end

  def read_menu
    @menu.menu
  end

  def order(dish, quantity = 1)
    @order.customer_order(dish, quantity)
  end

  def view_basket
    @order.basket
  end

  def complete_order(price)
    fail "Incorrect amount for the order" unless correct_amount?(price)
    send_text("Thank you! Your order was placed and will be
      delivered before #{Time.now + 3600}")
  end
  def total
    @order.total
  end

  private

  def correct_amount?(price)
    @total_price = @order.total
    @total_price == price
  end

  def send_text(message)
    @messenger.send_sms(message)
  end

end
