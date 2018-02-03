require_relative 'menu'

class Restaurant

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def menu
    @menu
  end

end
