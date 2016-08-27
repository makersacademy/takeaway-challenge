require_relative 'menu'
require_relative 'order'

class TakeAway

attr_reader :order

def initialize(menu = Menu.new, order = Order.new)
  @menu = menu
  @order = order
end

  def show_menu
    p 'Please check the menu and place your order.'
    @menu.show_menu
  end

  def order_dish(dish, quantity)
    has_order(dish)
    @order.add(dish, quantity)
  end

  def query_price(dish)
    @menu.dish_price(dish)
  end

  def show_total
    @order.calculate_total
  end

  def check_order(price)
    p is_correct_amount?(price)
    @order.show_order
  end

  def confirm_order(answer)
    answer == "yes" ? verify_order : @order.delete_order
  end

  private

  def has_order(dish)
    fail "#{dish.upcase} is not a dish available on the menu, please try again." unless @menu.has_dish?(dish)
  end

  def is_correct_amount?(price)
    show_total == price
  end

  def verify_order
    fail 'You cannot place an order as your basket is empty.' unless @order.order_exists?
    send_verification
  end

  def send_verification(message = Messenger.new)
    message.send_message
  end

end
