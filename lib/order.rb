require_relative 'menu'

class Order
  attr_reader :basket, :total, :menu

  def initialize
    @basket = []
    @total = 0
    @menu = Menu.new.menu
  end

  def order(dish, amount)
    basket << "#{dish} X #{amount} = £#{menu[dish] * amount}"
    @total += (menu[dish] * amount)
    "#{amount}X #{dish} added to your basket"
  end

  def receipt
    "#{basket.join("\n")}\n Total = #{total}"
  end

end
