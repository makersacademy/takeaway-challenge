class Menu

  MENU = {
    hotdog: 5.00,
    fries: 3.50
  }

  attr_reader :menu

  def initialize
    @menu = MENU
  end

  def print_menu
    MENU.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end

end
