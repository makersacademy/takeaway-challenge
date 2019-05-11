require_relative 'menu'

class TakeawayService

  def initialize(menu_class = Menu)
    @menu_class = menu_class
  end

  def view_menu
    menu = @menu_class.new
    menu.view
  end
end
