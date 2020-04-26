require_relative 'menu'
require_relative 'takeaway'

class Kitchen
  attr_reader :order_total, :order_cart
  attr_accessor :order_complete

  def initialize
    @menu = Menu.new
    @order_total = []
    @order_cart = []
  end

  def order(order)
    @order_total << @menu.menu[order] if in_menu?(order)
    @order_cart << "Item: #{order}, cost #{@menu.menu[order]}£" if in_menu?(order)
  end

  def order_total
    @order_cart.each do |order|
      puts order
    end
    puts "Your order total: #{@order_total.sum}£"
  end

  private

  def in_menu?(order)
    @menu.menu.key? order
  end

end

