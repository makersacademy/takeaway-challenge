require_relative 'order'
require_relative 'menu'
require_relative 'messenger'

class Restaurant

  def initialize(order_class = Order, menu = Menu, messenger = Messenger.new)
    @order_class = order_class
    @menu = menu
    @messenger = messenger
  end

  def show_menu
    @menu.show_menu
  end

  def add_to_menu(item,price)
    @menu.add(item,price)
  end

  def show_order
    @order_class.show_order
  end

  def check_total
    "£#{@order_class.check_total}"
  end

  def checkout(amount)
    fail "Amount is not correct" unless correct_total?
    @messenger.send_text
  end

  private
  def correct_total?
    amount == number_total
  end

  def number_total
    @order_class.check_total
  end
end
