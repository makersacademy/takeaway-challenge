class Menu
  def initialize
    @menu = {"Margherita" => 6,
      "Pepperoni" => 7,
      "Vegetariana" => 7,
      "Hawaiian" => 7,
      "Garlic Pizza Bread" => 4}
  end

  def show
    puts menu
  end

  def get_price(item)
    fail 'This item is not currently on our menu' if !menu.include?(item.capitalize)
    menu[item.capitalize]
  end

  private

  attr_reader :menu

end
