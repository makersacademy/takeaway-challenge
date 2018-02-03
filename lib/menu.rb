class Menu

  attr_reader :dishes, :selected

  def initialize
    @dishes = {
      pizza: 10,
      bolognese: 8,
      risotto: 9,
      red_wine: 4,
      white_wine: 4.50
     }
    @order = Order.new
  end

  def order(dish)
    order = { dish => nil }
    order[dish] = @dishes[dish]
    @order.save_order(order)
  end

  def sum
    @sum = 0
    @selected.each do |dish|
      dish.each_value { |price| @sum += price }
    end
    @sum
  end
end
