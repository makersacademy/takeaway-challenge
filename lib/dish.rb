class Dish
  attr_reader :name, :price
  attr_accessor :quantity
  def initialize name, price
    @name = name
    @price = price
    @quantity = 0
  end

  def readable
    "#{'%-30s' % (name + ":")} £#{'%5.2f' % price}"
  end
end
