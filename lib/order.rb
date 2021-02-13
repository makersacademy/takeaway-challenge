class Order

# will need to be an array of hashes - dish name and price
  def initialize
    @list = []
  end

  def view
    @list.each { |item| puts "#{item.name.capitalize}: £#{item.price}" }
    total = calculate
    puts("Total price is £#{total}")
  end

  def add(menu, dish)
    status = menu.check(dish)
    unavailable_error(status)
    not_on_menu_error(status)
    @list.push(status) if status.class == Dish
  end

  private

  def calculate(calc_class = Calculator)
    prices = []
    @list.each { |item| prices.push(item.price) }
    @calc = calc_class.new
    total = @calc.total(prices)
  end

  def unavailable_error(status)
    puts("I'm sorry, that dish is currently unavailable") if status == :unavailable
  end

  def not_on_menu_error(status)
    puts("I'm sorry, that dish is not on our menu") if status == :not_on_menu
  end

  # check dish on menu

  # check dish available

  # add up prices

  # print list

end
