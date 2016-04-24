require_relative 'order'
require_relative 'menu'
require_relative 'messenger'

class Restaurant

  def initialize(order_class = Order, menu_class = Menu, messenger_class = Messenger)
    @order_class = order_class.new
    @menu_class = menu_class.new
    @messenger_class = messenger_class.new
    @complete = true
  end

  def show_menu
    @menu_class.show_menu
  end

  def add_to_menu(item,price)
    @menu_class.add_to_menu(item,price)
  end

  def add_to_order(quantity,item)
    fail "No such item!" unless self.include?(item)
      @order_class = order_class.new if complete?
      @order_class.add_to_order(quantity,item)
      puts "#{quantity} X #{item} added to basket"
      @complete = false
  end

  def show_order
    fail "no order created" if @order_class == nil
    @order_class.show_order.each
  end

  def check_total
    @order_class.check_total
  end

  def include?(item)
    @menu_class.include?(item)
  end

  def complete?
    @complete
  end

  def checkout(amount)
    fail "Amount is not correct" unless amount == check_total
    @messenger_class.send_text
    @complete = true
  end
end
