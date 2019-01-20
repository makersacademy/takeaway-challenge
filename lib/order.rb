require_relative 'menu'

class Order
  attr_reader :receipt, :menu

  def initialize
    @menu = Menu.new
    @receipt = []
  end

  def select_dish(dish, quantity)
    # quantity.times { @basket << @menu.menu.select { |k,v| k == dish.to_sym } }
    quantity.times { @receipt << @menu.menu[dish.to_sym] }
    "#{quantity}x #{dish}(s) added to your basket."
  end
end
