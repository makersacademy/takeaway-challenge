class Menu

  DEFAULT_MENU = {
    llomo_saltado: 14.99,
    ratatouille: 9,
    chicken_and_chips: 5.50,
    ceviche: 10
  }

  attr_reader :dishes_list

  def initialize
    @dishes_list = DEFAULT_MENU
  end

  def print_menu
    dishes_list.map do |dish, price|
      '%s £%.2f' % [dish.to_s.capitalize, price]
    end.join(", ")
  end

  def includes?(dish)
    dishes_list.include?(dish)
  end
end

class Order

  attr_reader :menu, :dishes_ordered

  def initialize(menu)
    @dishes_ordered = {}
    @menu = menu
  end

  def place_order(dish, quantity)
    @dish = dish
    raise order_error unless Menu::DEFAULT_MENU.include?(dish)
    dishes_ordered[dish] = quantity
  end

private

  def order_error
    error = "#{@dish} doesn't exist on the menu"
    OrderError.new(error)
  end
end

class OrderError < StandardError
end
