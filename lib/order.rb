class Order
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(dish_number)
    @basket << @menu.provide_dish(dish_number)
  end

  def basket
    BASKET_HEADER + basket_list + total
  end

  private

  BASKET_HEADER = "Your order:\n"

  def basket_list
    @basket.map { |dish| dish.details }.join("\n")
  end

  def total
    total = @basket.map { |dish| dish.price }.sum
    "\nTotal: £#{total}"
  end
end
