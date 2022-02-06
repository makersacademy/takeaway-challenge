require_relative './order'
require_relative './menu'

class Takeaway

  attr_reader :order

  def initialize(dishes = Menu.new)
    @dishes = dishes
  end

  def menu
    @dishes.items
  end

  def new_order
    Order.new(@dishes.items)
  end

end
