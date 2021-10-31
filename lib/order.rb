require_relative '../lib/menu'

class Order
  attr_reader :basket, :menu, :dishes

  def initialize
    @basket = Hash.new(0)
    @order_total = 0 
    @menu = Menu.new
  end

  def add_to_order(dish, quantity)
    @basket[dish] = quantity
  end

  def basket_items_total 
    @basket.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

  def order_total 
    basket_items_total.inject(:+)
  end

end