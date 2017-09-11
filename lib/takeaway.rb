require_relative "menu"

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    menu.print_menu
  end

end
