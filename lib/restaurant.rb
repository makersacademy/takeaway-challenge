require_relative 'menu'

class Restaurant
  include Menu

  attr_reader :menu

  def initialize(name)
    @name = name
    @menu = MENU[name.to_sym]
  end

  def display_menu
    @menu
  end

end