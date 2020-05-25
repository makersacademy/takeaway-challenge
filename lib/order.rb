require './lib/takeaway.rb'
class Order
  attr_reader :items, :menu
  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    @items[dish] = 0 unless items[dish]
    @items[dish] += quantity
    "#{dish} X #{quantity} added to your order"
  end

  def single_item_price(dish)
    @menu.dishes[dish]
  end

  def order_price
    total = 0
    @items.each do |dish, quantity|
      total +=  single_item_price(dish) * quantity
    end
    total
  end
end
