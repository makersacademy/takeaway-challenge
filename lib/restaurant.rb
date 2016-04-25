require_relative 'order'
require_relative 'menu'
require_relative 'messenger'

class Restaurant

  attr_accessor :complete

  def initialize(order_class = Order, menu = Menu.new, messenger = Messenger.new)
    @order_class = order_class.new
    @menu = menu
    @messenger = messenger
  end

  def show_menu
    @menu.show_menu
  end

  def add_to_menu(item,price)
    @menu.add_to_menu(item,price)
  end

  def add_to_order(quantity = 1,item)
    fail "No such item!" unless include?(item)
    @order_class.add_to_order(quantity,item)
    "#{quantity} X #{item} added to basket"
  end

  def show_order
    fail "No order created" if @order_class.empty?
    @order_class.show_order.each
  end

  def check_total
    @order_class.check_total
  end

  def include?(item)
    @menu.include?(item)
  end

  def checkout(amount)
    fail "Amount is not correct" unless amount == check_total
    @messenger.send_text
  end
end
