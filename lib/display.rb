class Display
  CONFIRMATION_PROMPT   = 'Confirm order? Hit ⏎ to confirm, c to cancel'
  INVALID_MEAL          = ' is not a meal. Please make a valid choice'
  MEAL_ADD_CONFIRMATION = ' has been added to your order 🍕'
  ORDER_CONFIRMATION    = ['Thanks for your order! Check your phone',
                           ' for confirmation. Buon Appetito!'].join

  def view_menu(menu)
    menu.map { |meal, price| "#{meal.to_s.capitalize}: #{format(price)}" }
  end

  def view_order(order)
    output = order.map { |meal| view_menu(meal).pop }
    output << "Total: #{format(total(order))}"
  end

  def confirm_added(meal)
    "#{meal.capitalize}#{MEAL_ADD_CONFIRMATION}"
  end

  def confirm_order
    puts CONFIRMATION_PROMPT
    input = gets.chomp
    fail if input == 'c'

    puts ORDER_CONFIRMATION
  end

  def invalid(meal)
    "#{meal}#{INVALID_MEAL}"
  end

  private

  def total(order)
    order.map(&:values).map(&:pop).sum
  end

  def format(amount)
    "£%.02f" % amount
  end
end
