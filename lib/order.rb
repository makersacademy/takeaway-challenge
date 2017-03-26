require_relative 'menu'
#responsible for tracking current order, similar to journey
class Order
  attr_reader :dishes

  def initialize(menu:)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    raise "Can't place order, #{dish} isn't on the menu" unless menu.has_dish?(dish)
    dishes.merge! dish => quantity
    # dishes[dish] = quantity
  end

  def total

  end

  private
  attr_reader :menu

end
