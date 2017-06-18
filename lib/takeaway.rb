require 'sms'

class Takeaway

attr_reader :menu, :order, :total_per_product, :sms

  def initialize
    @menu = Menu.new
    @order
    @total_per_product = []
    @sms
  end


  def add_order(dish, quantity)
    @order = Order.new if @order.nil?
    @order.add_to_basket(dish, quantity)
    @total_per_product << (quantity * @menu.dishes[dish])
  end

  def total
    total_per_product.inject(0, :+)
  end

  def order_check
    puts "Here is your order:/n#{order.display_basket},/n for a total of: #{self.total}./nRun 'confirm_order(price)' if you wish to place your order." unless order.nil?
  end

  def confirm_order(price)
    @sms = Sms.new(price)
    sms.send
  end
end
