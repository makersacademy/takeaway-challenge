class Takeaway

  attr_reader :basket, :menu

  def initialize(basket_class=Basket, menu_class=Menu)
    @basket = basket_class.new
    @menu = menu_class.new
  end

  def add(dish, qty=1)
    @basket.add(priced_dish(dish, qty))
  end

  def remove(dish, qty=1)
    @basket.remove(priced_dish(dish, qty))
  end

  def place_order(total)
    actual_total = @basket.calc_total
    raise 'Re-calculate and enter correct total' unless total == actual_total
    
  end

  private

  def priced_dish(dish, qty)
    price = @menu.find_price(dish)
    priced_dish = {name: dish, amount: qty, price: price}
  end

end
