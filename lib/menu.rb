class Menu
  attr_reader :menu_list
  def initialize
    @menu_list = {
      tortilla: 4,
      gazpacho: 3,
      pasta: 5,
      pizza: 5,
      lasagna: 5.5,
      salad: 4,
      coke: 2.5
    }
  end
  def display_menu
    menu_list.each_pair { |dish, price| p "Dish: #{dish}, price: £#{price}"}
  end
end
