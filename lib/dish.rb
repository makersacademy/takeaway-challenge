class Dish
  attr_reader :price
  def initialize price
    @price = price
  end

  def self.burger
    Dish.new 6.00
  end

  def self.cheeseburger
    Dish.new 7.00
  end

  def self.doublecheese
    Dish.new 9.00
  end

  def self.hotdog
    Dish.new 5.00
  end

  def self.fries
    Dish.new 3.00
  end
end
