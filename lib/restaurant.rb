require_relative 'menu'

class Restaurant
  include Menu

  attr_reader :menu

  def initialize(name = "Deli")
    @name = name
    @menu = MENU
  end

end