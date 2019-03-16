require_relative 'dish'
class Order
  def initialize
    @order = []
  end

  def add(item)
    @order << item
  end

  def full
    @order
  end
end
