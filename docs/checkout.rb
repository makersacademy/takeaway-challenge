require './docs/order.rb'
require './docs/menu.rb'

class Checkout

attr_reader :checkout_basket

  def initialize
    @checkout_basket = {}
  end

  def save_order(dish, quantity)
    @checkout_basket.store(dish, quantity)
  end

  def calculate_total
    total = 0
    @checkout_basket.each do |k, v|
    total = total + (v * Menu.new.find_price(k))
    end
    total
  end

end
