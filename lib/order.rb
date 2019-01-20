require_relative 'menu'

class Order
  attr_reader :take_order

  def initialize
    @take_order = []
  end

  def customer_order(item, amount)
    @take_order << { item: item, amount: amount }
  end
  
end
