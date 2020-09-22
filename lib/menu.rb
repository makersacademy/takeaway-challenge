class Menu

  def initialize(food = {Noodles: 6.25, Pizza: 11.78, Curry: 6.25})
    @food = food
  end

  def list
    @food
  end
end