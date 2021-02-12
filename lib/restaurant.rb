class Restaurant
  def view_menu
    menu.meals
  end

  def add(meal)
    order << menu.meals.slice(meal)
  end

  def view_order
    order.dup
  end

  private

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end
end
