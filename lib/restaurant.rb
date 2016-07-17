require_relative 'menu'
require_relative 'basket'

class Restaurant

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end
r
  def show(obj)
    item_printer(obj.dishes)
  end
end
