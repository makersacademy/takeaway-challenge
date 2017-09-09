require_relative 'menu'

class Cart
  attr_reader :basket, :menu

  def initialize(basket = Hash.new(0))
    @basket = basket
    @menu = Menu.new
  end

  def order(dish, quantity = 1)
    raise 'Item unavailable' if !menu.dishes.include?(dish)
    @basket[dish] += quantity
    p "#{quantity}x #{dish}(s) added to your basket"
  end

  def total_price
    total = 0
    basket.each do |dish, quantity|
      total += (quantity * menu.price(dish))
    end
    total
  end
end
