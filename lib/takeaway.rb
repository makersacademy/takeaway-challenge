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

  private

  def priced_dish(dish, qty)
    price = @menu.find_price(dish)
    priced_dish = {name: dish, amount: qty, price: price}
  end

end
