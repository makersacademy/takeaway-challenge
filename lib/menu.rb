class Menu

  MENU_LIST = {
    'cheeseburger' => 10,
    'hamburger' => 15,
    'baconburger' => 8.5,
    'chickenburger' => 12.5
    }

  attr_reader :menu_list

  def initialize(menu_list = MENU_LIST)
    @menu_list = menu_list
  end

  def display_menu
    @menu_list.each { |item, price| "#{item}: £#{price}" }
  end

end
