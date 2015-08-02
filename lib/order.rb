require_relative 'menu'

class Order
  MENU = { Pizza: 5,
           Pasta: 4,
           Steak: 6,
           Cod: 5 }

  attr_reader :menu

  def initialize menu = MENU
    @menu = menu
    @ordered_dishes = {}
    @total = 0
  end

  def show_menu
    result = ''
    @dishes.each do |dish, price|
      result += ("#{dish}, £ #{price}\n")
    end
    result
  end

  def add_order(dish, quantity)
    @ordered_dishes[dish] = quantity
  end

end