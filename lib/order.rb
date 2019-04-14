class Order

  attr_reader :current_order
  attr_reader :order_total

  def initialize
    @current_order = []
    @order_total = 0
  end

  def check_order
    @current_order.each { |a| a.each { |x,y| @order_total += y }}
    puts "#{@order_total}\n#{@current_order}\n"
    @order_total = 0
  end
end
