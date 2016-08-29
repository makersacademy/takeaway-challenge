#Understands how to select dishes
require_relative 'menu'

class Order

  attr_reader :selected_dishes, :total

  def initialize
    @selected_dishes = Hash.new(0)
    @total = 0
  end

  def select_dishes(dish, price, quantity)
    @selected_dishes[dish] += quantity
    @total += (price * quantity)
  end
end
