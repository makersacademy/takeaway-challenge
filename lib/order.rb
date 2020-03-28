class CustomerOrder
  attr_reader :order
  
  def initialize
    @order = []
  end

  def see_order
    @choice = { 'apple' => 3 }
  end

  def total
    @choice = { 'apple' => 3 }.values.sum
  end
end