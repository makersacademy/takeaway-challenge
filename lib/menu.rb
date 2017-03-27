# Contains a list of dishes and prices which can be displayed.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
  end

  def read_menu
    @dishes
  end

end
