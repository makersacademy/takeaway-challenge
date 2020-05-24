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
  end

  def get_price(dish)
    @menu.dishes[dish]
  end

  def get_total_price
    total = 0
    @items.each do |dish, quantity|
      total +=  get_price(dish) * quantity
    end
    total 
  end
end
