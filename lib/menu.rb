class Menu 

  def initialize
    @menu = {
        'Egg fried rice': 12.50
    }
  end

  def display_menu
    @menu.map { |food, price| "#{food}: £#{price}" }
  end

end