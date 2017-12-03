require_relative 'menu'

class Order

  attr_reader :basket, :menu
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add_order(item, quantity = DEFAULT_QUANTITY)
    item = item.split.map(&:capitalize).join(" ")
    raise "This item is not on the menu" unless @menu.menu.include?(item)
    quantity.times { @basket << item }
  end

  def price
    total_price = 0
    @basket.each do |item|
      total_price += @menu.menu[item]
    end
    total_price.round(2)
  end

end
