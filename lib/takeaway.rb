require_relative 'menu'

class TakeAway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.items
  end

  def read_menu
    @menu
  end

end
