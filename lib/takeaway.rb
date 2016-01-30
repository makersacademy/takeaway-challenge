
require_relative 'menu.rb'

class Takeaway

  def initialize(restaurant_type)
    @menu = Menu.new(restaurant_type)
  end

  def show_menu
    @menu.show
  end

end
