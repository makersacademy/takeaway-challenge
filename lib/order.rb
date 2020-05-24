class Order
attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = []
  end

  def add(dish)
    @dishes.push(dish)
  end

end