require_relative 'menu'
require_relative 'takeaway'


class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @order_total = 0
    @menu = Menu.new
  end


  def add(item, quantity)
    @basket[item] = quantity
  end

  def order_summary
    @basket.each do |item, quantity|
      puts "#{quantity}x #{item}: £#{Menu.new.menu[item] * quantity}"
    end
  end

    def basket_total
    @basket.inject(0) do |total, (dish, quantity)|
    @dish_total = total + @menu.menu[dish] * quantity
    end
  end
end
