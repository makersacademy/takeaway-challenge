
class Menu
  attr_reader :items
  def initialize
    @items = Hash.new(0)
  end

  def add_dish(dish, price)
    @items[dish] = price
  end

  def list
    @items.each { |k, v| print "#{k}: £#{v} " }
  end
end
