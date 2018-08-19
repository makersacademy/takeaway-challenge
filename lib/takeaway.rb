class Takeaway

  attr_reader :menu
  def initialize(menu = MENU_LIST)
    @menu = menu
  end

  def display_menu
    menu
  end
end