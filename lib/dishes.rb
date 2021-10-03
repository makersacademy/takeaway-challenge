class Dishes 
  
  #Dishes --> see_price --> hash_of_prices 
  #Dishes --> hash_of_prices --> select_dish --> dishes_selected 
  def see_price
    menu = { "Small Chips" => 2.00,
             "Medium Chips" => 4.00, 
             "Large Chups" => 6.00, 
             "Cod" => 4.50,
             "Chicken Wings" => 3.50, 
             "Beans" => 2.00,
             "Mixed Veg" => 2.40,
             "Eggs" => 1.25, 
             "Mushrooms" => 0.70 }
            
             puts "Please select dishes"
             puts menu 
    end 
  
  def select_dish
    customer_select_dish = gets.chomp 
    dishes_selected =+ customer_select_dish.last 
    puts "Total" + dishes_selected
  end 

end 

class Confirmation 
  #Confirmation --> dishes_selected --> selected_dish_total --> confirmed 
  #Confirmation --> confirmed --> text_sent 
  #--> "Thank you! Your order was placed and will be delivered before 18:52"
  
  def selected_dish_total
    if dishes_selected == selected_dish_total.last 
      puts "Thank you! Your order was placed and will be delivered before 18:52"
    else 
      puts "Check order"
    end 
  end 

end 