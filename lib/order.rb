# contains a list of items and quantity
class Order
  attr_reader :basket
  def initialize
    @basket = []
  end

  def add(menu, dish_index, quantity)
    quantity.times { @basket << menu.dishes[dish_index - 1]}
  end

  def total
    total = 0
    @basket.each { |item| 
    total += item.price
    puts "1 x #{item.name} @ £#{'%.2f' % (item.price / 100.00)}"
    }
    puts "TOTAL: £#{'%.2f' % (total / 100.00)}"
  end
end