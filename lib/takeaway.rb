require 'menu'
require 'basket'
require 'pry'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @current_basket = Basket.new
  end

  def menu
    @menu.view
  end

  def order(dish)
    fail "Dish unavailable" if !@menu.list.has_key? dish
    cost = @menu.list[dish]
    @current_basket.basket[dish]=cost
  end

  def review_order
    @current_basket.review_order
  end

end
