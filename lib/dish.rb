class Dish
  attr_reader :name, :price, :course
  def initialize(name, price, course)
    @name = name
    @price = price
    @course = course
  end
end
