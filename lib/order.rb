class Order
  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def view_menu
    Menu::LIST_OF_DISHES
  end

  def add_dish(*dishes_to_order)
    dishes_to_order.each { |dish| @current_order << dish  }
  end
end
