require_relative 'menu'

class Order

  attr_reader :this_order, :menu

  def initialize(menu=Menu.new)
    @this_order = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity=1)
      @this_order[dish] += quantity
  end

  def total_price
    total = 0
    @this_order.each do |dish, quantity|
      total += (@menu.price(dish)) * quantity
    end
    total
  end

end
