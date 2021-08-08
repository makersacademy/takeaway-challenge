class Customer
  attr_accessor :order
  
  def initialize
    @order = { items: [], total_cost: 0 }
  end
end
