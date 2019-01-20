require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def select_dish(dish, quantity)
    quantity.times { @basket << @menu.menu.select { |k,v| k == dish.to_sym } }
    "#{quantity}x #{dish}(s) added to your basket."
  end
end
