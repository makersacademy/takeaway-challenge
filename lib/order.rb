class Order
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(dish_number)
    @basket << @menu.provide_dish(dish_number)
  end

  def basket
    header = "Your order:\n"
    list = @basket.map { |dish| dish.details }.join("\n")
    total = @basket.map { |dish| dish.price }.sum
    footer = "\nTotal: £#{total}"
    header + list + footer
  end

end
