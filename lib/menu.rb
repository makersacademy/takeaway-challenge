class Menu

MENU_ITEMS = 
  { "burger" => 7,
    "fish" => 8,
    "smoothie" => 4,
    "eggs" => 3 }


def see_dishes
  dishes
end

private
  def dishes
    @dishes = MENU_ITEMS
  end

end
