require_relative 'menu'

class Order
  attr_reader :menu
  attr_reader :basket

  ERROR = "Item not found or unavailable"

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu.display
  end

  def take(dish, quantity = 1)
    raise ERROR unless dish_exists?(dish)

    @basket << [dish,  quantity]
    repeat_order(dish, quantity)
  end

  def display
    basket_with_prices.map { |arr|
      "#{arr[0]} x #{arr[1]} = £#{arr[2] * arr[1]}"
    }.join(", ")
  end

  def details
    basket_with_prices
  end
  
  private

  def basket_with_prices
    @basket.map { |arr|
      [arr[0], arr[1], @menu[arr[0]]]
    }
  end

  def repeat_order(dish, quantity)
    "#{quantity}x #{dish}(s) added to basket"
  end

  def dish_exists?(dish)
    @menu.key?(dish)
  end
end
