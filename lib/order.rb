require_relative 'menu'

class Order

  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def add(item)
    fail "#{item} does't exist on the menu" if menu.does_not_contain?(item)
    item
  end

  def calc(basket)
    total = 0.00
    basket.each do |item|
      itemcost = menu.dishes[item]
      total += itemcost
    end
    total.round(2)
  end

end
