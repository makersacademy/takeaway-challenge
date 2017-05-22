class Order
  attr_reader :in_basket

  def initialize
    @in_basket = []
  end

  def view_menu
    Menu::LIST_OF_DISHES
  end

  def add_dish(*dishes_to_order)
    dishes_to_order.each { |dish| @in_basket << dish  }
  end
end
