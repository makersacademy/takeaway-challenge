require_relative "restaurant"
class Menu

attr_reader :dishes

  def initialize
    @dishes = {
      "char siu buns" => 1.00,
      "taiwanese rice" => 5.00
      }
  end

  def display_menu
    @dishes.map { |key, value| "#{key.capitalize}, Price #{value}" }
  end

end
