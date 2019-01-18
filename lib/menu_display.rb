require_relative 'menu'

class MenuDisplay
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.menu
  end

  def list_menu
  end

  def price_to_sterling(item)
    '£' + menu[item].to_s
  end

end
