class Dish
  attr_reader :name, :price

  def initialize(name = "", price = 0)
    @name = name
    @price = price
  end

  # to_s overrides the puts method
  # dish = Dish.new('xyz',10)
  # `dish` will return '[#<Dish:0x00007f8b5ba944b0 @name="xyz", @price=10>]'
  # `puts dish` will return "Name: #{name}, Price: #{price}"
  def to_s
    "Name: #{name}, Price: #{price}"
  end
end