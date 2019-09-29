require_relative 'menu'

class Order
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.view_menu
  end

  def add_dish

  end

end
