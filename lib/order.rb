# Holds order summary
# Caluculates order summary
# Sends text messaage
require_relative "menu"
class Order
  attr_reader :summary, :total

  def initialize(menu_class = Menu)
    @summary = []
    @total = 0
    @menu = menu_class.new
  end

  def add(dish, quantity)
    @summary << {name: dish, quantity: quantity}
  end 

  def total
    @summary.each do |ordered_dish|
      @menu.menu.each do |dish|
        @total += (dish[:price] * ordered_dish[:quantity]) if ordered_dish[:name] == dish[:name]
      end 
    end
    @total
  end
end 