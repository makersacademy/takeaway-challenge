class Order

# will need to be an array of hashes - dish name and price
  def initialize
    @list = []
  end

  def view
    @list.dup
  end

  def add(menu, dish)
    status = menu.check(dish)
    unavailable_error(status)
    not_on_menu_error(status)
    @list.push(dish) if status == :present
  end

  private

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
