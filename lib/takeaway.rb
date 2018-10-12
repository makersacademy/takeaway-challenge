class Takeaway
  
  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99, 
    "fu-king fried rice" => 5.99 }
  end
  
  def read_menu
    @menu
  end

  def order(food)
    
  end

end

x = Takeaway.new
x
