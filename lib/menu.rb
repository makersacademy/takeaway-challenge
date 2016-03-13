class Menu


  def see_dishes
    dishes
  end

  def dish_price(dish)
    return_dish_price(dish)
  end
    
  def check_dish(dish)
    dish_in_menu?(dish)
  end

private

  def dishes
    @dishes = MENU_ITEMS
  end


  MENU_ITEMS = 
  { "burger" => 7,
    "fish" => 8,
    "smoothie" => 4,
    "eggs" => 3 }

  def return_dish_price(dish)
    dishes[dish]
  end
  
  def dish_in_menu?(dish)  
    see_dishes.include?(dish) 
  end

end
