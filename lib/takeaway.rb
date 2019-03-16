require_relative 'takeaway_menu'

class TakeAway

  def initialize(menu_class = TakeAwayMenu, menu = TakeAwayMenu.new)
    @menu = menu
  end

  def read_menu
    @menu.read
  end

end
