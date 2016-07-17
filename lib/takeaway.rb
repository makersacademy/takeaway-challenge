class Takeaway

  def initialize
    @menu = Menu.new
  end

  def display_menu
    @menu.dishes
  end

end
