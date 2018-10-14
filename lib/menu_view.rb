class MenuView

  def initialize(menu)
    @menu = menu
  end

  def display
    @menu.dup
  end

end
