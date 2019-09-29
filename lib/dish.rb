class Dish
attr_reader :name, :cost

  def initialize(name:, cost:)
    @cost = cost
    @name = name
  end
end
