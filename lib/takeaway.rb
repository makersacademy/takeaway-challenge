require 'menu'
require 'order'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.display
  end
end
