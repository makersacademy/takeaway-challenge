class Customer

  def initialize
    @order = []
  end

  def order
    @order
  end 

  def add_to_order(item)
    @order << item
  end 

end