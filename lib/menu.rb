# Class responsible for looking at the menu
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

  def has_dish?(dish)
    dishes.include?(dish) ? true : false
  end
end
