class Menu

  def initialize
    @dishes = {}
  end

  def to_s
    return 'Menu is empty' if dishes.empty?
    pretty_print
  end

  def add_dish(dish, price)
    fail 'Dish already in the list!' if dishes.key?(dish)
    @dishes[dish] = price
  end

  def remove_dish(dish)
    fail 'Dish not in the list!' unless dishes.key?(dish)
    @dishes.delete(dish)
  end

  def dishes
    @dishes.dup
  end

  private

  def pretty_print
    msg = format('%1$- 20s %2$s %3$s', 'DISH', 'PRICE', "\n")
    msg << '-' * 26 + "\n"
    dishes.each { |k, v| msg << format('%1$- 20s %2$s %3$s', k, v, "\n") }
    msg << '-' * 26
  end

end
