require_relative 'menu'
require_relative 'basket'

class Takeaway
  attr_reader :dishes, :basket

  def initialize(basket = Basket.new)
    @basket = basket
    @menu = Menu.new
    @dishes = []
  end

  def read_menu
    @menu.display_menu
  end

  def order
    basket.place_order
    #basket.sum_order
 
  end

  def total
    basket.sum_order
  end

end
