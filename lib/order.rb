require_relative 'menu'

class Order
  attr_reader :basket, :total, :menu

  def initialize(dishes = Menu.new)
    @basket = []
    @total = 0
    @menu = dishes.menu
  end

  def order(dish, amount)
    raise "no such item in to take away!" unless @menu.include?(dish)
      basket << "#{dish} X #{amount} = £#{menu[dish] * amount}"
      @total += (menu[dish] * amount)
      "#{amount}X #{dish} added to your basket"  
  end

  def receipt
    "#{basket.join("\n")}\n Total = #{total}"
  end

end
