class Dish
  ERR_NO_MATCH = "Dish names are not equivalent. This dish cannot be altered"
  attr_reader :name, :cost
  def initialize(name, cost)
    @name = name
    @cost = cost
  end

  def alter(other)
    raise ERR_NO_MATCH if @name != other.name
    @cost = other.cost
    # If the dish has other attributes these would be updated here.
  end

end
