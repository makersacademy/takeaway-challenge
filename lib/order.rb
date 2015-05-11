require_relative 'menu'

class Order
  attr_accessor :orders, :delivered, :order_cost
  def initialize
    @orders = []
    @delivered = false
    @order_cost = 0
  end

  def delivered?
    @delivered
  end

  def in_progress?
    !@delivered
  end

  def order_calculation
    @order_cost = orders.map{|x| x.values}.flatten(1).inject(:+)
  end

  def order_sent
    @delivered = true
  end

  def order_empty?
    @orders.empty?
  end
end