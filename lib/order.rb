# Holds order summary
# Caluculates order summary
# Sends text messaage
require_relative "menu"
class Order
  attr_reader :summary, :total

  def initialize(menu_class = Menu.new)
    @summary = []
    @total = 0
    @menu = menu_class
  end

  def add(dish, quantity)
    @summary << { name: dish, quantity: quantity }
  end 

  def calc_total
    @summary.each do |ordered_dish|
      @menu.menu.each do |dish|
        if ordered_dish[:name] == dish[:name]
          @total += (dish[:price] * ordered_dish[:quantity]) 
        end 
      end 
    end
  end

end 
