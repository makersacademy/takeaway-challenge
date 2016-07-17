class Dish
attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = info[:price]
  end
end
