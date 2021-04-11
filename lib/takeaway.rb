class TakeAway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def display_menu
    menu.display
  end
end
