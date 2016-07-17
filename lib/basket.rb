class Basket
  attr_accessor :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, number)
    @basket.key?(dish) ? @basket[dish] += number : @basket[dish] = number
  end

  def total
    @basket.inject(0) {|sum, (dish,quantity)| sum + Menu::DISHES[dish]*quantity}
  end

  def empty
    @basket = {}
  end

end
