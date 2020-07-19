require_relative 'menu'
require_relative 'basket'

class Takeaway
  attr_reader :menu
  
  def initialize(menu = Menu.new, basket_class = Basket)
    @menu = menu.items
    @basket_class = basket_class
  end

  def current_basket
    @current_basket ||= @basket_class.new
  end
  
  def view_basket
    current_basket.items
  end

  def add_to_basket(item)
    current_basket.add(item)
  end

end

# view_menu to puts menu