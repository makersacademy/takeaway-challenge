class Takeaway

  def initialize(menu_class = Menu)
    @menu = menu_class.new
  end

  def read_menu
    @menu
  end

end
