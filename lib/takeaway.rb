class Takeaway
  attr_reader :menu, :order

  def initialize(order = Order.new)
    @menu = [{:chips => 1.80}, {:burger => 10.00}]
    @order = order
  end

  def menu
    @menu
  end

  def place_order
    @order
  end
end
