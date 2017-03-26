# place a specific order
# fulfil_order by confirming to customer
require_relative 'menu'

class Order

  attr_reader :total, :menu, :items

  def initialize(menu)
    @menu = menu
    @items = Hash.new(0)
  end

  # add dishes if they already in hash
  def add(dish, quantity=1)
    @items[dish] += quantity
    dish
  end

  def total_price
    total =
    @items.inject(0) { |acc, item| acc + (self.menu.dishes[item.first] * item.last) }
    total.round(2)
    # @items.sum{ |dish, quantity| quantity * menu.dishes[dish] }
  end


  private

  attr_writer :items

end
