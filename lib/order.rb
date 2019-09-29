require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @order_summary = []
    @menu = menu
  end

  def add_to_basket(item, quantity)
    @basket[item] += quantity
  end

  def order_summary
    @basket.map do |key, value|
      "#{value} x #{key} = £#{value * @menu.price(key)}"
    end.join(", ")
  end

  def order_total
    total = 0
    @basket.each do |key, value|
      total += value * @menu.price(key)
    end
    total
  end
end
