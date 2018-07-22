require_relative "menu"
class Restaurant

  attr_reader :menu

  def initialize(menu_object = Menu)
    @menu = menu_object.new    
  end

  def print_menu
    @menu.print_menu
  end
end 
