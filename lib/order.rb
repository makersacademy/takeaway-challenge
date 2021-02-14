class Order

# will need to be an array of hashes - dish name and price
  def initialize(dish_class = Dish, calc_class = Calculator, text_class = Texter)
    @list = []
    @dish_class = dish_class
    @calc_class = calc_class
    @text_class = text_class
  end

  def add(menu, dish)
    status = menu.check(dish)
    check_errors(status)
    @list.push(status) if status.class == @dish_class
  end

  def view
    @list.each { |item| puts "#{item.name.capitalize}: £#{item.price}" }
    puts("Total price is £#{calculate}")
  end

  def place
    if @text_class.new.send == :message_sent
      puts "Your order has been successfully placed"
    else
      puts "Something has gone wrong, please try again"
    end
  end

  private

  def calculate
    prices = @list.map { |item| item.price }
    calc = @calc_class.new
    calc.total(prices)
  end

  def check_errors(status)
    unavailable_error(status)
    not_on_menu_error(status)
  end

  def unavailable_error(status)
    puts("I'm sorry, that dish is currently unavailable") if status == :unavailable
  end

  def not_on_menu_error(status)
    puts("I'm sorry, that dish is not on our menu") if status == :not_on_menu
  end

end
