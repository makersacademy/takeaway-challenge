
class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = [
      { "Chicken wings" => 10 },
      { "Jerk Chicken" => 15 },
      { "Lemon Chicken" => 20 },
      { "BBQ Chicken" => 25 },
      { "Steamed Lobster" => 50 }
    ]
  end

  def view_menu
    @menu_items
  end
end
