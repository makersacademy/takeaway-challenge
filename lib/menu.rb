class Menu
  attr_reader :dishes

    MENU = {
      "sashimi" => 5,
      "tempura" => 4,
      "uni" => 4
    }

  def initialize
    @dishes = MENU
  end

  def print_menu
    @dishes.map do |dish, price|
      "#{dish.capitalize}: £#{price}"
    end.join(", ")
  end


end
