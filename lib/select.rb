require_relative 'dishes'

class Select
  attr_writer :menu

  def initialize(menu = Dishes.new)
    @menu = menu
    p @menu
  end

  def order(dishes)
    # order.push(dishes)
  end
end
