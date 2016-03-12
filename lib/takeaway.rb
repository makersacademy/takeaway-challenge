require_relative 'menu'

class Takeaway
  
  def initialize(menu_klass=Menu)
    @menu_class = menu_klass
    @menu = @menu_class.new
  end
  
  def see_dishes
    @menu.dishes
  end

  def menu
    @menu
  end
end
