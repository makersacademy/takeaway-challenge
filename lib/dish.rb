class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def show_details
    "#{name}: £#{price.to_s}"
  end
end
