require './lib/menu.rb'

class Order
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_dish(dish, quantity)
    @basket[dish.to_sym] += quantity
    output = "#{quantity}x #{dish}(s) added to your basket"
    output
  end

  def basket_summary
    raise "Your basket is empty!" if basket.empty?
  end

  def total
    basket.inject(0) {|total, (dish, quantity)| total += price(dish)*quantity}
  end

  def total_output
    output = "Total = £#{sum}"
    output
  end
end
