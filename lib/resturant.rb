class Resturant

  def initialize(menu = Menu)
    @menu = menu.new.dishes
  end

  def show_menu
    @menu
  end
end
