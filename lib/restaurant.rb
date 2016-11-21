require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :menu, :basket

  def initialize(order_klass = Order, menu_klass)
    @order = order_klass.new
    @menu_klass = menu_klass
    @menu = menu_klass.list
  end

  def print_menu
    puts menu.map{ |food,price| "#{food}: £#{price}" }
  end

  def add_to_basket(input)
    order.add_to_basket input
  end

  def show_basket
    basket.each{|item, quantity| puts "#{quantity} #{item.to_s}#{quantity>1 ? 's' : ''}"}
  end

  def checkout(payment)
    order.check_payment payment
    order.send_message
  end

  def print_total
    checkout(0)
    total = order.calculate_total
    puts "Your total is £%.2f" % total
  end



  private
  attr_reader :menu_klass, :order

  def basket
    order.basket
  end


end
