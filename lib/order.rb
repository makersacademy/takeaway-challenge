require_relative "menu"

class Order
  
  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @menu = ""
  end

  def see_menu
    @menu = @menu_class.new
    @menu.check_menu
  end
end