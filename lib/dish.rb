class Dish
  
  attr_reader :cost, :name

  def initialize(cost:, name:)
    @cost = cost
    @name = name
  end
end
