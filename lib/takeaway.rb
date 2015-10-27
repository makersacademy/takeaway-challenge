class Takeaway
  attr_reader :menu, :order, :messenger, :result

  ERROR = "Total cost does not match the sum of the dishes in your order!"

  def initialize(menu = Menu.new, order = Order.new, messenger = Messenger.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def open_menu
    menu.open
  end

  def add_to_order(item, num = 1)
    order.add_basket(item, num)
    "#{num}x #{item}(s) added to your basket."
  end

  def order_summary
    order.basket_summary(menu)
  end

  def total
    @result = order.bill(menu) unless empty?
    "Total: £#{@result}"
  end

  def checkout(amount = 0)
    is_correct_amount?(amount) ? (send_sms) : (fail ERROR)
  end

  private

  def empty?
    order.basket.empty?
  end

  def is_correct_amount?(amount)
    amount == total
  end

  def send_sms
    messenger.send_text
  end
end