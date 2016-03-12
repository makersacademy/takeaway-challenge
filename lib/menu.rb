class Menu

  def initialize
    @food = [{food: "pasta", price: "30"}]
  end

  def list
    @food.dup
  end
end
