
#Understands how to select dishes
require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :selected_dishes, :total, :menu, :text

  def initialize
    @selected_dishes = Hash.new(0)
    @total = 0
  end

  def select_dishes(dish, quantity)
    @selected_dishes[dish] += quantity
  end

  def total_price
    selected_dishes.each do |dish, quantity|
      @total += (quantity * (Menu.new.price_check(dish)))
    end
    @total
  end


end
