require './lib/menu'

class Order

  attr_reader :basket, :total, :menu, :price_count

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
    @price_count = []
  end

  def add(dish)
    menu.dishes.each do |item, price|
      @basket << { dish => price } if dish == item
    end
    menu.dishes.each do |item, price|
      @price_count << price if dish == item
    end
  end

  def prices
    @price_count
  end

  def view_basket
    @basket
  end

  def view_total
    @total = @price_count.inject(0, :+)
    "£#{total}"
  end
end

#  def get_total(order)
#   format_order(order).map { |item, quantity| quantity * menu.dishes[item] }.inject(0, :+)
# end
