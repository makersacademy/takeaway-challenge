require_relative 'order'
require_relative 'text_creator'
require_relative 'text_sender'
class Interface
  def initialize(menu = nil, order = Order.new)
    @menu = menu
    @order = order
  end

  def get(choice, quantity = 0)
    @order.add(choice, quantity)
  end

  def show_total
    @order.total
  end

  def show_order
    @order.show
  end

  def checkout(money, number)
    raise "sums don't match!" if money < show_total
    finish(number)
  end
private
  def finish(number)
    text = TextCreator.new
    text = text.text
    sender = TextSender.new
    sender.send_text(text, number)
  end
end
