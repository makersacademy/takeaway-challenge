require_relative 'menu'

class Order

  attr_reader :order

  def intialize
    @menu = Menu.new
    @order = []
  end

  def add_to_order(item, quantity)

  end

end