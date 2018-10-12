class Takeaway

  def initialize(menu = Menu.new, format = FormatMenu.new)
    @menu = menu
    @format = format
  end

  def show_menu
    @format.format_menu(@menu.items)
  end

end
