class Customer 

  attr_accessor :order

  def initialize(order)
    @order = order
  end

  def place_order
    @order.downcase!
    return @order.gsub(/\s/, "").split(",") if @order.include?(",")
    
    @order.split(" ")
  end

end
