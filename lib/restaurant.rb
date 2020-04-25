class Restaurant
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    menu.print_menu
  end
end
