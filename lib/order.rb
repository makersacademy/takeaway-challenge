# place a specific order
# fulfil_order by confirming to customer
require_relative 'menu'

class Order

  attr_reader :total, :menu, :basket

  def initialize(menu)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(dish, quantity=1)
    @basket[dish] += quantity
    dish
  end

  def total_price
    total =
    @basket.inject(0) { |acc, item| acc + (menu.dishes[item.first] * item.last) }
    total.round(2)
    # @basket.sum{ |dish, quantity| quantity * menu.dishes[dish] }
  end




  private

  attr_writer :basket


end
