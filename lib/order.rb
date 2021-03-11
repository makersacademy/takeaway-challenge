class Order

  attr_reader :order_list, :order_total

  def initialize
    @order_list = Array.new
    @order_total = 0
  end
end
