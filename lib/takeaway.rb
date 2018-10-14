require 'menu_view'

class Takeaway

  def initialize(menu, menu_view_class = MenuView)
    @menu = menu
    @menu_view_class = menu_view_class
  end

  def display_menu
    @menu_view_class.new(@menu)
  end
end
