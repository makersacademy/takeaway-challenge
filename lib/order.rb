require './lib/menu.rb'

class Order
  def initialize(menu = Menu)
    @menu = menu
  end

  def see_menu
    my_menu = @menu.new
    my_menu.list
  end
end
