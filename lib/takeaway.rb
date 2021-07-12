require_relative './menu'

class Takeaway

  attr_reader :menu

  # initialize with keyword argument and a menu object stored as an instance variable.
  def initialize(menu)
    @menu = menu
  end

  def view_menu
    menu.display_menu
  end
end