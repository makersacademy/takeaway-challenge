class Order
  
  ERROR_NOT_INTEGER = "Error: only numbers can be supplied"
  
#   def initialize 
#     @order = Array.new 
#   end
  
  def add(number)
    raise ERROR_NOT_INTEGER unless number.is_a?(Integer)

  end
  
  def get 
  
  end

end
