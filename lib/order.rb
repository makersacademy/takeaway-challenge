require_relative 'menu'
class Order
  attr_reader :basket, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def place_order(dish, amount)
    raise 'dish not avaible' unless menu.has_dish?(dish)
    basket[dish] = amount


  end


def print
  @basket
end

private

end