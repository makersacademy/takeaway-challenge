require_relative 'menu'

class TakeAway
  attr_reader :menu

  def initialize
    @menu = Menu.new
  end

  def read_menu
    @menu.display_menu
  end

  def order_food(*food)
    @order = food
  end

  def total
    total = 0
    @order.each do |x|
      total += @menu.menu[x]
    end
    total
  end
end
