class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.items
  end

end
