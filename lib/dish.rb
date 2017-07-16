class Dish
  attr_reader :name, :id, :price

  def initialize(opts)
    @name   = opts[:name]
    @price  = opts[:price]
    @id     = opts[:id]
  end
end
