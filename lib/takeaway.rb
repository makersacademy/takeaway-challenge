require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu

  def intitialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.view_all
  end

end
