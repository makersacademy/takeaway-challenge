class Takeaway

#attribute reader
  def menu
    @menu
  end

 def initialize
   @menu = [
     Dish.new("Original Cheese & Tomato", 8),
     Dish.new("Pepperoni", 10),
     Dish.new("Vegi Supreme", 9),
     Dish.new("Hawaiian", 10),
     Dish.new("Ranch BBQ", 12),
     Dish.new("Garlic", 8),
   ]
 end

end
