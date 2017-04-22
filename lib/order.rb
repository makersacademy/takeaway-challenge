class Order

  attr_reader :trolley

  def my_order(number)
    menu = Menu.new
    @trolley = []
    @trolley << menu.pizzas.values[number - 1]
  end

end
