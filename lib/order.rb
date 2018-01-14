class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

  private

  attr_reader :menu

end
