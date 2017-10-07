class Dish
  attr_reader :name, :price
  def initialize name, price
    @name = name
    @price = price
  end

  def readable
    "#{name}: £#{'%.2f' % price}"
  end
end
