class Order
  def initialize(dish_class = Dish, calc_class = Calculator)
    @order_list = []
    @dish_class = dish_class
    @calc_class = calc_class
  end

  def add_dish(menu, dish)
    item = menu.check(dish)
    if item != nil
      @order_list << item
    else
      raise AvailabilityError
    end
  end

  def view_order
    puts "Dishes: "
    @order_list
    # puts "Total: #{total_price}"
  end

  private 

  def total_price
    prices = @order_list.map { |dish| dish.price }
    calc = @calc_class.new
    calc.total(prices)
  end
end
