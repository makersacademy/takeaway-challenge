class Takeaway

  def initialize
    @menu = {"Chicken Chow Mein" => "£6.00"}
  end

  def menu
    @menu
  end

  def add_to_menu(dish, price)
    @menu[dish] = price
  end

end
