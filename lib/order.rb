require_relative 'menu'
require_relative 'takeaway'

class Order
  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @basket_total = 0
    @menu = Menu.new
  end

  def add_to_order(dish, quantity)
    @basket[dish] = quantity
  end

  def order_summary
    @basket.each do |item, quantity|
      puts "#{item} x #{quantity}: £#{Menu.new.menu[item] * quantity}"
    end
  end

  def basket_total
    @basket.inject(0) do |total, (item, quantity)|
      @item_total = total + @menu.menu[item] * quantity
    end
  end

end
