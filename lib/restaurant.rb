require_relative 'menu'
require_relative 'dish'

class Restaurant

  attr_reader :menu

  def initialize(menu = nil)
    @menu = Menu.new(menu)
  end

  def view_menu
    @menu.display_menu
  end


end