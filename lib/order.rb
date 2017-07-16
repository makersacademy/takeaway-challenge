require_relative 'menu'

class Order

  attr_reader :menu, :ordered_dishes

  def initialize(menu = Menu.new)
    @menu = menu
    @ordered_dishes = Hash.new
  end

  def read_menu
    menu.print_menu
  end

  def order_dish(name,quantity)
    ordered_dishes[:name] = quantity
  end
end
