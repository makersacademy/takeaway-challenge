
class Menu

  MENU = {  "Beef Burger" => 8.5 ,
            "Cheese Burger" => 9.00 ,
            "Honest Burger" => 10.50 ,
            "Tribute Burger" => 10.50 ,
            "Special Burger" => 12.50 ,
            "Chicken Burger" => 9.5 ,
            "Fritter Burger" => 7.50 ,
            "Onion Rings" => 3.50 ,
            "Coleslaw" => 3.00 ,
            "House Salad" => 3.00 }

  def format_menu
    MENU.each { |item, price|
      "#{item}: £#{price}"
    }
  end

end
