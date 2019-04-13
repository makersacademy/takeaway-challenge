require_relative 'menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def check_menu
    @menu.list
  end

end
