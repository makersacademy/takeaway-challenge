require_relative 'menu'
require_relative 'order'
require_relative 'message'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, message = Message.new)
    @message = message
    @menu = menu
    @order = nil
  end

  def display_menu
    menu.display
  end

  def order(food,quantity=1)
    fail 'No such dish on menu' unless on_menu?(food)
    @order = Order.new(@menu.dish_list) if @order == nil
    @order.add_to_order(food,quantity)
  end

  def basket_summary
    @order == nil ? "Basket empty" : @order.basket
  end

  def total
    "Total: £#{@order.current_total}"
  end

  def confirm_order
    fail 'No orders have been added' if @order == nil
    @message.send_text if price_is_correct?
  end

  private

  def price_is_correct?
    @order.current_total == @order.total_price_of_basket
  end

  def on_menu?(food)
    @menu.dish_list.include?(food)
  end
end
