class Dish
  attr_reader :name, :price

  def initialize(options)
    @name = options.fetch(:name)
    @price = options.fetch(:price)
  end
end