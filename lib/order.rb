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
    # dishes.merge! dish => quantity
    dishes[dish] = quantity
  end

  def total
    return "Order placed: Your total is £#{total_value}"
  end

  def dish_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end


  def total_value
    "%.2f" % (dish_totals.inject(:+))
  end

  private
  attr_reader :menu

end
