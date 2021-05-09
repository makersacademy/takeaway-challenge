class Order
  attr_reader :current
  
  def initialize
    @current = []
  end

  def display 
    "Current order"
  end
end