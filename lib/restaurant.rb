require_relative "menu"
class Restaurant

  attr_reader :menu, :order

  def initialize
    @order = []
  end

  def load_menu(menu = Menu.new)
    @menu = menu
  end

  def choose(dish, quantity)
    quantity.times do
      @menu.dishes.select {|k, v| @order.push([k, v]) if k == dish }
    end
    puts "You ordered #{quantity} #{dish}"
    @order
  end

  # def choose(dish, quantity)
  #   @order << { food: dish, quantity: quantity }
  #   "You ordered #{quantity} #{dish}"
  # end

  def total
    cost = 1.0
    return "Your order will cost #{cost}"
  end

end
