require_relative 'order'
require_relative 'menu'
require_relative 'textmessenger'

class Takeaway

  CHECKOUT_ERROR = "Total cost entered does not match the sum of your order!"
  ITEM_ERROR = "This item does not exist!"

  attr_reader :menu, :order, :messenger, :total

  def initialize(menu=Menu.new, order=Order.new, messenger=TextMessenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def read_menu
    menu.read
  end

  def place_order(itm, qty=1)
    fail ITEM_ERROR if @menu.dishes[itm].nil?
    order.add_to_basket(itm, qty)
    "#{qty}x #{itm}(s) added to your basket."
  end

  def basket_summary
    order.basket_sum(menu)
  end

  def total_cost
    @total = order.total_bill(menu) unless empty?
    "Total Cost: £#{total}"
  end

  def checkout(final_cost)
    correct_amount?(final_cost) ? (send_msg) : (fail CHECKOUT_ERROR)
  end

  private

  def empty?
    order.basket.empty?
  end

  def correct_amount?(final_cost)
    final_cost == total
  end

  def send_msg
    messenger.send_text
  end

end
