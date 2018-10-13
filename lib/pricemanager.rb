class PriceManager

  DEFAULT_DISH_PRICE = 50

  def initialize
    @pricemap = {:drink => 5, :dessert => 10, :main => 15, :starter => 20}
  end

  def get_dish_price(category)
    return @pricemap[category.to_sym] if @pricemap.key?(category.to_sym)
  else return DEFAULT_DISH_PRICE
  end

  def calculate_order_value(orderlist)
    total = 0
    orderlist.each_pair do |dish, quantity|
      total += get_dish_price(dish.category) * quantity
    end
    total
  end
end
