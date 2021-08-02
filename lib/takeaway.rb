require_relative "menu"
require_relative "order"

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
  end
  
  def view_menu
    list = "**"
    @menu.dish_list.each do|dish|
      list += " #{dish[:dish]} - £#{dish[:price]} **"
    end
    list
  end
  
  def order(dish, number)
  end  
end  