class Customer
  attr_accessor :order
  
  def initialize
    clear_order
  end

  def clear_order
    @order = { items: [], total_cost: 0 }
  end
end
