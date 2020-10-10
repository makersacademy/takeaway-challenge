require_relative './menu'
class Restaurant

  RESTAURANT_NAME = "Rex Whistler Restaurant"

  attr_reader :menu

  def initialize(menu = Menu.new)
    @name = RESTAURANT_NAME
    @menu = menu
  end

  def show_menu
    menu_header + menu_body + menu_footer + "\n"
  end

  private
  def menu_header
    "Welcome to #{RESTAURANT_NAME}\n\nThis is our menu:\n\n"
  end

  def menu_body
    menu.to_s
  end

  def menu_footer
    "\n\nWhat would you like to order?"
  end

end
