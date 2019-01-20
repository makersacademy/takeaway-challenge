require_relative 'menu'
require_relative 'print'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def issue_menu
    @menu.display
  end

end
