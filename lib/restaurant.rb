require_relative 'menu'

class Restaurant
  attr_reader :menu
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    p @menu.menu_items
  end
end
