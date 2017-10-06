class TakeAway
  attr_reader :menu_class

  def initialize(menu_class = Menu)
    @menu_class = menu_class
  end

  def read_menu
    Menu.new.show_dishes
  end
end
