class Order
  attr_reader :order 
  
  ERROR_NOT_INTEGER = "Error: only numbers can be supplied"
  
  def initialize 
    @order = Array.new 
  end
  
  def add(number)
    raise ERROR_NOT_INTEGER unless number.is_a?(Integer)

    @order.push(number)
    @order.last
  end
  
#   def order 
#     @order
#   end

end
