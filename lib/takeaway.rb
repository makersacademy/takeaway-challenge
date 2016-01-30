require_relative 'menu.rb'

class TakeAway
  def read_menu(menu = Menu.new)
    menu.dishes
  end
end