require 'menu'

class Order
  attr_reader :dishes, :menu

  def initialize(menu = Menu.new)
    @dishes = {}
    # order adds in here
    @menu = menu
  end 

  def add(dish, quantity)
    fail "item is not on the menu" unless @menu.dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end 

  private
  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end 

end
