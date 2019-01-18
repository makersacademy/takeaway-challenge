require_relative 'menu'

class Order
  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def select_dish(dish, quantity)
    quantity.times { basket.push(@menu.menu[dish]) }
    "#{quantity}x #{dish}(s) added to your basket."
  end
end
