class Dish
  
  attr_reader :cost, :name, :description

  def initialize(cost: , name: , description:)
    @cost = cost
    @name = name
    @description = description
  end
end