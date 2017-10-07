class Dish
  require File.dirname(__FILE__) + '/defaults'
  attr_reader :name, :price
  def initialize(dish_info)
    @name = dish_info[:name]
    @price = dish_info[:price]
  end

  def to_s
    "#{name}: #{Defaults::DEFAULT_CURENCY}#{'%.2f' % price}"
  end
end
