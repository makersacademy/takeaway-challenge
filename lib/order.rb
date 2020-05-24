class Order
attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = []
  end

  def add(dish)
    raise "Apologies, #{dish} is not available" unless @menu.has_dish?(dish)
    @dishes.push(dish)
  end

end