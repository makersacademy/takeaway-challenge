class Order

  def initialize
    @menu = Menu.new
  end

  def see_menu
    @menu.display
  end

end
