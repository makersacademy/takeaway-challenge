require_relative 'menu'
class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(dish, quantity = 1)
    basket[dish] += quantity
  end

  def total
    basket_total.inject(:+)
  end

  private

  def basket_total
    @basket.map { |order, quantity| @menu.price(order) * quantity }
  end

end
