require_relative 'menu.rb'

class Takeaway
  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
  end

  def menu
    @menu.dishes.dup
  end
end
