class Menu
  attr_reader :menu_list
  def initialize
    @menu_list = {
      tortilla: 4,
      gazpacho: 3,
      pasta: 5,
      pizza: 5,
      lasagna: 6,
      salad: 4,
      coke: 2
    }
  end

  def display_menu
    menu_list.each_pair { |dish, price| p "Dish: #{dish}, price: £#{price}" }
  end

  def dish_included?(dish)
    @menu_list.has_key?(dish)
  end

  def dish_price(dish)
    @menu_list[dish]
  end
end
