require_relative "menu"

class Order
  def initialize(menu: )
    @menu_class = menu
  end

  def list_dishes
    @menu_class.dishes
  end

end