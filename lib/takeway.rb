class Takeway

  attr_reader :menu_list

  DEFAULT_MENU_LIST = {
    'Napolitana Pizza' => 16.32,
    'Proscuiutto Pizza' => 13.50,
    'Hawaiian Pizza' => 12.35,
    'Quattro Formaggi Pizza' => 10.50,
    'Fiorentina Pizza' => 13.45,
    'Ruspante Pizza' => 11.20,
    'Milano pizza' => 12.60,
    'Gamberoni Pizza' => 8.75,
    'Capricciosa Pizza' => 10.99
  }

  def initialize(menu_list = DEFAULT_MENU_LIST)
    @menu_list = menu_list
  end

  def read
    @menu_list.each { |item, price| "#{item} : #{price}" }
  end

end
