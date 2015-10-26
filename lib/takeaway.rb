require_relative 'menu'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :menu, :order, :total

  ERROR = "Total cost does not match the sum of the dishes in your order!"

  def initialize(menu_klass = Menu.new, order_klass = Order.new)
    @menu = menu_klass
    @order = order_klass
  end

  def open_menu
    menu.open
  end

  def order(item, quantity = 1)
    order.add_basket(item, quantity)
    "#{quantity}x #{item}(s) added to your basket."
  end

  def order_summary
    order.basket_summary(menu)
  end

  def total
    @total = order.total(menu) unless empty?
    "Total: £#{sprintf('%.2f', @total)}"
  end

  def checkout(amount = 0)
    is_correct_amount? ? send_sms : fail ERROR
  end

  private

  def empty?
    order.basket.empty?
  end

  def is_correct_amount?
    amount == total
  end

  def send_sms
    messenger.send_text
  end
end