require 'menu'
require 'basket'
require 'pry'

class Takeaway

  def initialize(menu = Menu.new)
    @menu = menu
    @current_basket = Basket.new
  end

  def order
    @menu.view
  end

# this works, want to add error message if dish not on list
  def add_to_basket(dish)
    if @menu.list.has_key? dish
      cost = @menu.list[dish]
      @current_basket.basket[dish]=cost
    end
  end

end
