require_relative '../lib/menu.rb'
require_relative '../lib/basket.rb'
require_relative '../lib/text.rb'

class Takeaway

  def initialize(menu = Menu.new, current_basket = Basket.new, sms = Text.new)
    @menu = menu
    @current_basket = current_basket
    @sms = sms
  end

  def menu
    @menu.view
  end

  def order(dish)
    fail "Dish unavailable" unless @menu.list.has_key? dish
    cost = @menu.list[dish]
    @current_basket.basket[dish] = cost
    "Added #{dish.downcase} to your order"
  end

  def review_order
    @current_basket.review_order
  end

  def place_order(amount)
    fail "Incorrect total" unless amount == @current_basket.total
    @sms.text
    "Your order has been place. You will recieve a confirmation text shortly."
  end

end
