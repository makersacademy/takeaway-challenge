require_relative "menu"

class ShowMenu

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @menu.display_menu
  end
end
