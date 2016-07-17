require_relative 'menu'
require_relative 'basket'

class Restaurant

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end
r
  def prnt(obj)
    page_format(obj.dishes)
  end
end
