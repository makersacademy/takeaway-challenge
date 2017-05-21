class Order

  attr_reader :current_order, :order_total

  def initialize
    @current_order = []
    @order_total = nil
  end

  def get_total
    price_list = @current_order.map { |e| e.values }
    @order_total = price_list.flatten.inject(:+)
    puts "Your order comes to #{@order_total}."
    puts "You ordered: #{@current_order.each { |x| puts x }}"
  end
end
