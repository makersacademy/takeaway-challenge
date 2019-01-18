require_relative 'menu'

class Order
  attr_reader :menu
  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu.display
  end

  def take(dish, quantity)
    @basket << [ dish,  quantity ]
  end

  def display
    basket_with_prices.map { |arr|
      "#{arr[0]} X #{arr[1]} = £#{arr[2] * arr[1]}"
    }.join(", ")
  end

  def basket_with_prices
    @basket.map { |arr|
      [arr[0], arr[1], @menu[arr[0]]]
    }
  end
end