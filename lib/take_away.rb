class TakeAway

  def initialize (menu:)
    @menu = menu
  end
  def show_menu
    menu.list_menu
  end
attr_reader :menu
end
