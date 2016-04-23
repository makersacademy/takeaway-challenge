class Order
  
  def initialize
    @trolley = []
  end
  
  def take_order(an_order, quantity = 1)
    trolley << [an_order, quantity]
  end
  
  def check_order
    trolley.dup
  end

  private
  
  attr_reader :trolley

end