require_relative './menu'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.list_items
  end
end
