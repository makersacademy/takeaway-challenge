class Takeaway 
  attr_reader :dish, :price, :order, :menu 
  def initialize 
    @dish 
    @price 
    @order = []
    @menu 
    
  end 
  
  #Dishes --> see_price --> hash_of_prices 
  def dish_price
    @menu = { "Small Chips" => 2.00,
             "Medium Chips" => 4.00, 
             "Large Chips" => 6.00, 
             "Cod" => 4.50,
             "Chicken Wings" => 3.50, 
             "Beans" => 2.00,
             "Mixed Veg" => 2.40,
             "Eggs" => 1.25, 
             "Mushrooms" => 0.70 }
            
             puts "Please select dishes"
             puts @menu 
    end 
  
  #Dishes --> hash_of_prices --> select_dish --> dishes_selected 
  def select_dish(dish)
    puts "Select dish please"
    @order.push(dish)
  end 
end 
