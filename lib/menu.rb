# Menu class responsible for printing the menu with dishes and prices
class Menu
  attr_reader :dishes

  def initialize(dishes:)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |dish, price|
      "%s - £%.2f" % [dish.to_s.gsub("_", " "), price]
    end.join(", ")
  end
end
