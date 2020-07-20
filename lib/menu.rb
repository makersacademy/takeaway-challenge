require_relative "order"

class Menu
  MENU = {
    "lasagna" => 10,
    "spaghetti" => 5,
    "gnocchi" => 7
  }

  def list
    MENU
  end
end
