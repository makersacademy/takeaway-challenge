require_relative 'menu'

class Order

  attr_reader :order, :menu

  def initialize(menu = Menu.new)
    @order = Hash.new(0)
    @menu = menu
  end

  def add_dish(pasta)
    @menu.check_availability(pasta)
    @order[pasta] += @menu.dishes[pasta]
  end
end
