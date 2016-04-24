class Order
  
  def initialize
    @trolley = []
    @cost = 0 
  end
  
  def take_order(an_order, quantity = 1)
    quantity.times {trolley << an_order}
    trolley.each { |order| order.each {|k,v| cost += v.to_f} }
  end
  
  def check_order
    trolley.dup
  end

  def total_cost
    total = cost
    total
  end

  private
  
  attr_reader :trolley, :cost
  

end