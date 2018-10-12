class TakeAway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.menu_items
  end
end
