require_relative './menu'

class TakeAway
  def initialize(menu: Menu.new)
    @menu = menu
  end

  def menu
    @menu.list_dishes
  end
end
