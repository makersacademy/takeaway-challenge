require_relative 'menu'

  
class Order
    
  attr_accessor :dishes, :order_list
    
  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = []
  end

  def add(dish, quantity)
    @menu.dishes.each do |item| 
    @order_list << {name: dish, quantity: quantity, price_each: item[1]} if item[0] == dish 
    end
  end

  def total
   @total_price = @order_list.map do |item| item[:quantity] * item[:price_each] end.reduce(:+)
  end

  def checkout?(total)
    @total_price != total ? raise 'No can do' : complete
  end

  def print_menu
    @menu.display
  end
end
