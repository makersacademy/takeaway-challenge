require_relative 'menu'

class Restaurant
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def format_menu
    @menu.format
  end
end
