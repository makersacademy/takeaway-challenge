
class Order
  attr_reader :dishes, :menu, :display, :total
  

  def initialize(menu)

    @dishes = Hash.new(0)
    @menu = menu
    @total = 0
  end

  def place_order(dish, quantity)
    fail "the requested item is not on the menu" unless menu.dish_available?(dish)
    @dishes[dish] += quantity
  end

  def order_total
    @total = dish_total.inject(:+)
  end

private
  def dish_total
    @dishes.map do |dish, quantity|
      menu.calculate_price(dish) * quantity
    end
  end


end # => class Order
