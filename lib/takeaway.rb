class Takeaway


  def initialize(menu = Menu.new)
    @menu = menu
  end

  def get_menu
    menu.print_menu
  end

private

attr_reader :menu

end
