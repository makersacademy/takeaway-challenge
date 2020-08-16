class Order

  attr_reader :dishes, :menu

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    raise "#{dish.capitalize} is not available" unless menu.has_dish?(dish)
    @dishes[dish] = quantity
  end


end