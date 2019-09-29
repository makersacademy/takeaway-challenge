require_relative 'menu'

class OrderList

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
    @order_summary = []
    @menu = Menu.new
  end

  def add_to_basket(item, quantity)
    @basket[item] += quantity
  end

  def order_summary
    @basket.each do |key, value|
      @order_summary << "#{value} x #{key} = £#{value * @menu.price(key)}"
    end
    @order_summary.join(", ")
  end

  def order_total
    total = 0
    @basket.each do |key, value|
      total += value * @menu.price(key)
    end
    total
  end
end
