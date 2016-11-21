class Menu

ALL_DISHES = {1 => {"Chicken Adobo" => 4.50},
2 => {"Pancit Bihon" => 4.50},
3 => {"Pancit Canton" => 4.50},
4 => {"Sizziling Pork Sisig" => 5.00},
5 => {"Pork Sinigang" => 5.00},
6 => {"Sizziling Beef Sisig" => 4.50},
7 => {"Stir Fried Vegetables" => 3.50},
8 => {"Rice and Lechon" => 5.50}
}

attr_reader :view_menu

  def initialize
    @view_menu = ALL_DISHES
  end

end
