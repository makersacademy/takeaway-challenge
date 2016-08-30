require_relative 'menu'

class Basket
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket= {}
    @menu = menu
    @total = 0
  end

  def add(dish, quantity)
    @menu.dishes.each do |item, price|
      if item == dish
        @basket["#{quantity}x #{dish}"] = price*quantity
      end
    end
  end

  def basket_summary
    @basket.map do |dishes, cost|
    "#{dishes}: £#{cost}"
    end.join(", ")
  end

  def total
    @total = @basket.values.inject(0) { |total, price| total + price }
    "£#{@total}"
  end

end
