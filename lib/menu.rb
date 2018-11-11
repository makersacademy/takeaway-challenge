class Menu
  attr_accessor :menu

  def initialize
    @menu = { large_chips: 1.99, medium_chips: 1.49, small_chips: 0.99 }
  end

  def add_dish(dish, price)
    @menu[dish.to_sym] = price
  end

  def remove_dish(dish)
    @menu.delete(dish.to_sym)
  end

  def display
    @menu.each { |key, val| puts "#{key}....£#{val}".center(160) }
  end

end
