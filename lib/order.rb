require_relative '../lib/menu.rb'

class Order < Menu
  attr_reader :basket

  def initialize
    @basket = []
  end

  def order_dish(quantity = 1, dish)
    menu_item = lookup_item(dish)
    while quantity > 0
      @basket << menu_item
      quantity -= 1
    end
  end

  def lookup_item(dish)
    @@dishes.select { |item, _price| item == dish }
  end
end
