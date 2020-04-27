require_relative 'menu'
require_relative 'basket'
class TakeAway

  attr_reader :menu, :basket, :total

  def initialize( menu = Menu.new, basket = Basket.new )
   @menu = menu
   @basket = basket
   @total = 0
  end

  def gets_menu
    @menu.generator
  end

  def adds(list_number, value)
    dish = select(list_number)
    @basket.adding(dish, value )
  end

  def checks_out
    @basket.total
  end

  def order
   p "Thank you! Your order was placed and will be delivered before 18:52"
 end


  private
  def select(list_number)
    @menu.list[list_number]
  end


end
