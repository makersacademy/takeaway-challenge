require_relative 'menu'

class Takeaway

attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def menu_list
    @menu.show
  end

  def add(dish, amount)
    fail 'Thats not on the menu!' if menu.do_we_have(dish) == false
    @order << {item: dish, qty: amount}
  end


end
