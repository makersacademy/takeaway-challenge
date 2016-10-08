require_relative 'menu'

class Takeaway
  attr_reader :menu


  def print_menu
    @menu = Menu.new
    @menu.dishes_list
  end

  def order_dishes
  end

end
