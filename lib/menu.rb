class Menu

  def initialize
    self.dishes = {}
  end

  def to_s
    return 'Menu is empty' if dishes.empty?
    pretty_print
  end

  def add_dish(dish, price)
    fail 'Dish already in the list!' if has?(dish)
    @dishes[dish] = price
  end

  def remove_dish(dish)
    fail 'Dish not in the list!' unless has?(dish)
    @dishes.delete(dish)
  end

  def has?(dish)
    dishes.key?(dish)
  end

  def dishes
    @dishes.dup
  end

  private

  attr_writer :dishes

  def pretty_print
    msg = format('%1$- 20s %2$s %3$s', 'DISH', 'PRICE', "\n")
    msg << '-' * 26 + "\n"
    dishes.each { |k, v| msg << format('%1$- 20s %2$s %3$s', k, v, "\n") }
    msg << '-' * 26
  end

end
