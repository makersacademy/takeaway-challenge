require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = MENU
  end

  def add_to_basket(dish, qty = 1)
    qty.times { @basket << dish }
  end
end
