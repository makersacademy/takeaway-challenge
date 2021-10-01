class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.print
  end
end
