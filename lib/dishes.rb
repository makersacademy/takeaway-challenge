class Dishes
  attr_reader :dishes, :print_dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_dishes
    @dishes.map do |item, price|
      "#{item}: £#{'%.2f' % price}"
    end
  end

  def add_dish(item, price)
    @dishes[item] = price
  end

  def in_stock?(dish)
    @dishes.any? {|item, price| item == dish}
  end
end
