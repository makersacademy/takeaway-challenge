require_relative 'restaurant'
require_relative 'basket'
require_relative 'text'

class Order

  attr_reader :menu, :basket, :text, :restaurant

  def initialize
      @restaurant = Restaurant.new
      @basket = Basket.new
      @text = Text.new
  end


  def see_menu
    restaurant.menu
  end

  def add_meal(item)
    basket.add_to_basket(item)
  end


  def view_basket
    basket.view_basket
  end

  def confirm_order (total)
  fail "wrong amount" if  total != basket.total
  text.send
  basket.empty
  "Order sent"

  end



end
