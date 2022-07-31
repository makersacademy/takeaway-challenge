class Meal
  attr_accessor :dishes, :menu

  def initialize(menu_class = Menu)
    @dishes = []
    @menu = menu_class.new
  end

  def order(*customer_order)
    @dishes = customer_order
  end

  def total
    menu.price(dishes)
  end
end
