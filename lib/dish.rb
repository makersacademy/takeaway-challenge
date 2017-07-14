class Dish
  def initialize(opts)
    @name = opts[:name]
    @price = opts[:price]
  end

  def name
    @name
  end

  def price
    @price
  end
end
