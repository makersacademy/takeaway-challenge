require './lib/menu.rb'
require './lib/order.rb'
require './lib/confirmation_text.rb'

class Takeaway

  attr_reader :order, :menu

  def initialize(order = Order.new, menu = Menu.new, text_message=ConfirmationText.new)
    @order = order
    @menu = menu
    @text_message = text_message
  end

  def menu_select(order, amount = 1)
    raise 'Item is not on menu' unless @menu.menu_list.key?(order)
    amount.times { @order.basket << @menu.menu_list.slice(order) }
    "#{amount}x #{order} added to your basket"
  end

  def make_payment(payment)
    price = @order.total_price
    raise "Incorrect payment: The order total is £%.2f" % price unless payment == price
    "Thank you for your order, you should recieve a confimation text message soon"
    # @text_message.send_text
  end

  def view_menu
    @menu.menu_list
  end

  def view_total_price
    @order.calculate_price
    "Total  = £#{@order.total_price}"
  end

  def view_basket
    @order.basket_summary
  end

end

# test = Takeaway.new
# test.menu_select('pepperoni', 2)
# test.menu_select('awesome sauce', 1)
# test.view_basket
# test.view_total_price
# test.make_payment(24)
