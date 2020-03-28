require_relative 'menu'

class Order

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.list
  end

  def add(order)
    order = order.split(", ")
  end

end
