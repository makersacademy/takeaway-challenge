require_relative './takeaway'

class Order < Takeaway

  attr_reader :order_items

  def initialize
    @order_items = []
  end

  def add(dish, amount)
    @order_items << {:item => dish, :amount => amount}
  end
end
