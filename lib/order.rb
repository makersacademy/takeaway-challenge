require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu.display
  end

  def take(dish, quantity)
    @basket << [ dish,  quantity ]
  end

  def display
    @basket.map { |arr|
      "#{arr[0]} X #{arr[1]} = £#{@menu[arr[0]] * arr[1]}"
    }.join(", ")
  end
end