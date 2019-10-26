require_relative "restaurant"
class Menu

attr_reader :dishes

  def initialize
    @dishes = {
      "char siu buns" => 2.00,
      "taiwanese rice" => 5.00
      }
  end

  def display_menu
    @dishes
  end

end
