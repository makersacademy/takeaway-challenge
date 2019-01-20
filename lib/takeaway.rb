require_relative 'menu'
require_relative 'print'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display
    @menu.display
  end

end
