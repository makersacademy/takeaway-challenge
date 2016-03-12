require_relative "menu"

class TakeAway

  def initialize(menu)
    @menu = menu
  end

  def read_menu
    @menu.display
  end
end
