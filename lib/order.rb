require "./lib/menu.rb"

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
  end

  def add_dish(dish, quantity)
    raise "Dish not available. Please see menu for options." if !menu.dishes.include?(dish)
    basket.store(dish, quantity)
    return "#{quantity} x #{dish}(s) added to your basket."
  end

  def total
    total = 0
    basket.each do |k, v|
      total = total + (v * menu.get_price(k))
    end
    total
  end

end
