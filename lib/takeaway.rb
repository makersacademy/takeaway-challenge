require_relative 'menu'

class TakeAway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    @menu.list
  end

end
