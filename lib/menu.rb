require "./data/menu_list"

# Understands how to display a drinks menu
class Menu
  attr_reader :items

  def initialize
    @items = MENU
  end
end
