#Understands how to select dishes
require_relative 'menu'

class Order

  attr_reader :selected_dishes, :total, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = Hash.new(0)
    @total = 0
  end

  def select_dishes(dish, quantity)
    @selected_dishes[dish] += quantity
  end

  def total_price
    selected_dishes.each do |dish, quantity|
      @total += (quantity * (menu.price_check(dish)))
    end
    @total
  end
end
