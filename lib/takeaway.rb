require_relative 'menu'

class Takeaway

  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.items
  end

end
