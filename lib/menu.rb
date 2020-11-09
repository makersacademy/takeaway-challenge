class Menu

  MENU = {
    hotdog: 5.00,
    fries: 3.50
  }

  attr_reader :dishes

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

end
