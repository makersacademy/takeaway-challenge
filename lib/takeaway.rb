require_relative 'menu'
require_relative 'order'

class Takeaway


  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.items
  end



end
