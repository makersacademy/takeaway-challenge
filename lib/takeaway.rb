require_relative './menu'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    puts @menu.print_menu
  end

  def select(dish,quantity)
    raise "I'm sorry, we don't have that on our menu."
  end
end
