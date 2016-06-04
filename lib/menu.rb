require "./data/menu_list"

# Understands how to display a drinks menu
class Menu

  def initialize
    @drinks = MENU
  end

  def drinks
    @drinks.dup
  end
end
