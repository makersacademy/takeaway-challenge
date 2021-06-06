class Takeaway

  attr_reader :menu

  def initialize
    @orders = []
  end

  def take_orders(order)
    @orders << order
  end
end
