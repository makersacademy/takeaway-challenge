require_relative "menu"
require_relative "order"
require_relative "messenger"

class TakeAway
  CHECKOUT_ERROR = "Incorrect amount! Please check again.".freeze

  def initialize(menu, order_class, messenger_class)
    @menu = menu
    @order = order_class.new(@menu)
    client = Twilio::REST::Client.new ENV["ACC_SID"], ENV["AUTH"]
    @messager = messenger_class.new(client)
  end

  def read_menu
    @menu.display
  end

  def order(item, quantity = 1)
    @order.add(item, quantity)
  end

  def basket_summary
    @order.summary + ". " + total
  end

  def total
    "Total: £#{@order.sum}"
  end

  def complete_order(price)
    fail CHECKOUT_ERROR unless amount_correct?(price)
    send_text("Thank you for your order: £#{price}.")
  end

  private
  
  def amount_correct?(price)
    @order.sum == price
  end

  def send_text(message)
    @messager.send(message)
  end
end
