class Takeaway

  require_relative './menu'

  attr_reader :order

  def initialize
    @menu = Menu.new
  end

  def menu
    @menu.print
  end

  def new_order(*numbers)
    @order = Order.new(numbers)
  end

end
