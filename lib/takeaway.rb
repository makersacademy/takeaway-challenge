require './lib/menu'
require './lib/message'
require './lib/order'

class Takeaway

  attr_reader :order

  def initialize(filename='./lib/menu.csv')
    @menu_file = filename
    @menu = Menu.new(filename)
  end

  def print_menu
    @menu.read_menu
  end

  def please_may_i_order
    @order = Order.new(@menu_file)
    "Sure, go right ahead!"
  end

  def add_item(item, quantity=1)
    order.add_item(item, quantity)
  end

  def print_order
    order.print_order
  end

  def confirm_order(number)
    send_text(number)
    "Thank you for placing your order."
  end

  private

  def send_text(number)
    message = Message.new
    message.send_text(number)
  end

end
