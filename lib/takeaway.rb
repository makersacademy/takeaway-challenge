require_relative 'menu'

class Takeaway
  attr_reader :basket, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def display_menu
    @menu.print_dishes
  end

  def add_dish(dish, amount = 1)
    basket[dish] = amount
    "#{amount}x #{dish}(s) added to your basket."
  end



end