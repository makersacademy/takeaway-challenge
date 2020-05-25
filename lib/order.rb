class Order
 
  attr_accessor :order

  def initialize
    @order = []
  end

  def place(item, num)
    @order << { :item => item, :quantity => num }
  end
  
end