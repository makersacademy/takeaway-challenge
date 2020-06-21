class Menu
  attr_reader :dishes
  MENU = {
    "Margherita" => 5.00,
    "Pepperoni" => 8.00
  }

  def initialize
    @dishes = MENU
  end

  def view_menu
    @dishes.map do |dish, price|
      "#{dish}: £#{('%.2f' % price)}"
    end
  end

  def dish_available?(chosen_dish)
    unless @dishes.include?(chosen_dish) == false
      true
    end
  end
end
