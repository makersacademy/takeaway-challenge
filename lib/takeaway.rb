require_relative 'menu'

class TakeAway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu.show_menu
  end

  def order
  end
end
