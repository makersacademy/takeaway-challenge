require_relative 'menu'

class Order
  attr_reader :basket, :basket_total
  DEFAULT_QUANTITY = 1

  def initialize
    @basket = []
    @basket_total = 0
  end

  def add_item(name, quantity = DEFAULT_QUANTITY)
    dish = {name=> quantity}
    @basket.push(dish)
  end

  def update_basket_total
    @basket.each do |entry|
      entry.each do |name, quantity|
        @basket_total += ((name.price) * quantity)
      end
    end
  end

end
