class Menu

attr_reader :dishes

  def initialize
    @dishes = {
      "char sui buns" => 1.00,
      "taiwanese rice" => 5.00,
      "bibimbap" => 4.00
      }
  end

  def display_menu
    @dishes.map { |key, value| "#{key.capitalize}, Price #{value}" }
  end

end
