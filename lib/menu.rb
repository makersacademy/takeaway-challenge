class Menu

  MENU = {
    'half-rack of ribs' => 10,
    'full-rack of ribs' => 15,
    'burger' => 8
    }

  attr_reader :menu

  def initialize(menu = MENU)
    @menu = menu
  end

  def display_menu
    @menu.each { |item, price| "#{item}: £#{price}" }
  end

end
