require_relative 'menu'

class Takeaway
  def initialize(menu = Menu)
    @menu = menu.new
  end

  def view_menu
    @menu.show_menu
  end
end
