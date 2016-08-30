class Order
  attr_reader :dishes
  def initialize
    @dishes= {}
  end

  def add(dish, numer_of)
    @dishes[dish]= numer_of
  end
end