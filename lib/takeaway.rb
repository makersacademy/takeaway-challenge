class Takeaway

  def initialize (menu = Menu)
    @menu = menu.new
  end

  def show_menu
    @menu.show
  end

end
