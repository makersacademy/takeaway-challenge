require_relative "menu"
class Restaurant

  attr_reader :menu

  def load_menu(menu = Menu.new)
    @menu = menu
  end





end
