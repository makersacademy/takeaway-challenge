require_relative 'menu'

class Order
  attr_reader :menu, :basket

  ERROR = "Dish not found in menu"

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu.print
  end

  def add_dishes(dish, quantity = 1)
    raise ERROR unless dish_exists?(dish)

    @basket << [dish, quantity]
  end

  def show_basket
      print_prices.map { |arr|
        "#{arr[0]} x #{arr[1]} = £#{arr[2] * arr[1]}"
      }.join(", ")
  end

  def dish_exists?(dish)
    @menu.key?(dish)
  end

  def print_prices
    @basket.map { |arr|
      [arr[0], arr[1], @menu[arr[0]]]
    }
  end
end
