class Dish
  def initialize(opts)
    @name = opts[:name]
    @price = opts[:price]
    @id = opts[:id]
  end

  def id
    @id
  end

  def name
    @name
  end

  def price
    @price
  end
end
