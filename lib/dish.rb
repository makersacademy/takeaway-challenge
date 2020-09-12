class Dish
  attr_reader :name, :price

  FORMAT_LENGTH = 20

  def initialize(name, price)
    @name = name
    @price = price
  end

  def format
    "#{@name.ljust(FORMAT_LENGTH)} £#{'%.2f' % @price}"
  end
end