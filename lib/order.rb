require 'menu'
class Order
  attr_reader :items, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @items = Hash.new(0)
  end

  def show_menu
    @menu.list_dishes
  end

  def add_dish(dish, quantity=1)
    @items[dish] += quantity
  end

  def view_basket
    @items
  end
end
