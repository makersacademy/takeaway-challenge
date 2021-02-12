class Restaurant
  def see_menu
    menu.meals
  end

  private

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end
end
