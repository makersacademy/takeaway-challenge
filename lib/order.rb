require_relative 'menu'

class Order

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.list
  end

  def update(order)
    order = order.split(", ")
  end

end
