
class Menu

  def initialize
    @menu_items = {
      "burger" => 5,
      "pizza" => 10,
      "fries" => 2,
      "salad" => 3
    }
  end

  def list_items
    @menu_items
  end

end
