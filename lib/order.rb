# place a specific order
# fulfil_order by confirming to customer
require_relative 'menu'

class Order

  attr_reader :total, :menu

  def initialize(menu)
    @menu = menu
  end

  def add(dish, quantity=1)
    raise "#{dish} not available in menu" unless menu.contain_item?(dish)
    dish
  end

  def total_price(basket)
    total = 0.00
    basket.each do |item|
      total += menu.dishes[item]
    end
    total.round(2)
  end

  private

  attr_writer :item


end
