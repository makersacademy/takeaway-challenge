

class Restaurant
  def initialize(menu_class)
    @menu = menu_class.new
  end

  def view_menu
    @menu.view_menu
  end
end