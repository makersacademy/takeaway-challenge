class Dish
  attr_accessor :name, :ingredients, :price, :type

  def initialize(name = nil, ingredients = nil, price = nil, type = nil)
    @name = name
    @ingredients = ingredients
    @price = price
    @type = type
  end
end
