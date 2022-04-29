class Dishes

  def initialize
    @menu = {"Avocado On Toast" => 5.50, 
      "Poached Egg On Toast" => 5.00, 
      "Sliced Banana On Toast" => 4.50, 
      "Jam On Toast" => 4.50, 
      "Peanut Butter On Toast" => 5.50,
      "Scrambled Eggs On Toast" => 5.00,
      "Greek Yoghurt + Strawberries on Toast" => 6.50}
  end

  def show_menu
    @menu
  end

end
