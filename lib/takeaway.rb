class Takeaway
  
  attr_reader :menu, :order
  attr_accessor :to_cook
  
  def initialize
    @to_cook = []
    @order = []
    total_price = 0
  end

  def menu
     @menu = { "burger" => 4, "fries" => 2, "coke" => 1 } 
  end

  def order_in
    # confirmataion text to go here
  end
  
  def whats_cooking
    to_cook
  end
end