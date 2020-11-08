require './lib/menu'

class Restaurant
  def initialize

  end

  def see_menu
    Menu.new.dishes
  end
end
