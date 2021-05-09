class Order
  attr_reader :current
  
  def initialize
    @current = []
  end

  def display 
    @current.empty? ? "Empty order" : "#{@current}"
  end
end