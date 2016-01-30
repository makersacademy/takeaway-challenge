require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize(menu_klass = Menu)
    @menu = menu_klass.new
  end

  def menu
    @menu.dishes.dup
  end

end
