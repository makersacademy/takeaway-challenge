require_relative 'menu'

include Menu

class Takeaway

  def initialize
  end

  def read_menu
    Menu::read
  end

end
