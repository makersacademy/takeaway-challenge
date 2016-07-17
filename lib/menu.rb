class Menu



  def initialize
    @menu_hash = {
      chicken_fried_rice: 3.00,
      egg_fried_rice: 2.50,
      chow_mein: 4.50,
      sweet_and_sour_chicken: 5.00
    }
  end

  def display_menu
    @menu_hash
  end
end
