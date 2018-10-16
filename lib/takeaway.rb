class Takeaway
  
  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99, 
    "fu-king fried rice" => 5.99 }
    @food = []
    @price = []
  end
  
  def read_menu
    @menu
  end

  def order(food_name)
    @food << food_name
    @price << @menu[food_name]
  end

  def basket
    return "you have ordered #{@food}, it will cost #{@price.inject(0, :+)}"
  end

end
