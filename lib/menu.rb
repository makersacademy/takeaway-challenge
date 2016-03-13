class Menu


def see_dishes
  dishes
end

def dish_price(item)
  return_dish_price
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


end
