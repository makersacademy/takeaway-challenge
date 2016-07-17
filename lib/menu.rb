class Menu 
   def layout
      {dish: "£££" }
   end 

   def appetiser
      {"dish": "Bruschetta", "price": 2.00 }
   end
   
   def mains
       {"Spaghetti Pomodoro": 5.00, "b": 1.00}
   end
   
   def dessert
       {"Almond Cake": 4.00}
   end

   def dish_list
       dish_list = layout, appetiser, mains, dessert
   end
end
   
   menu = Menu.new
puts menu.dish_list
 {dish: "£££" }
   {"dish": "Bruschetta", "price": 2.00 }
 {"Spaghetti Pomodoro": 5.00, "b": 1.00}
{"Almond Cake": 4.00}