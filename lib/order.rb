require_relative 'menu'

class Order
  attr_reader :items

  def initialize(menu = Menu.new)
    @items = Hash.new(0)
    @total = 0
    @menu = menu
  end

  def add_to_order(dish, quantity = 1)
    @items[dish] += quantity
  end

  def order_total
    total = 0
    @items.each do |dish, quantity|
      total += quantity * @menu.dish_price(dish)
    end
    total
  end
end
