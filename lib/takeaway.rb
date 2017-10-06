class TakeAway
  attr_reader :menu_class

  def initialize(menu_class = Menu)
    @menu_class = menu_class
  end

  def read_menu
    @menu = Menu.new
  end
end
