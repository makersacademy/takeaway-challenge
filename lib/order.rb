class Order

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(plate, amount)
    dishes[plate] = amount
  end

end
