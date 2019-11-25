require 'menu'
class Order
  attr_reader :customer, :total
  
  def initialize 
    @customer = []
    @total = 0
    @list_of_dishes = {
      "Fish" => 3,
      "Chicken" => 2,
      "Pasta" => 2,
      "Bread" => 1
    }
  end
  
  def order(dish, quantity)
    raise "Dish not in the menu" if !@list_of_dishes.include?(dish.capitalize)
    
    @customer << "#{dish} x #{quantity}"
    @list_of_dishes.each { |key,value| key == dish.capitalize ? @total += value * quantity : 0}
  end
  
  def show_order
    puts "±±±± Order :\n\n"
    @customer.each { |item| puts item.capitalize }
  end
  
  def price
    puts "Total cost for the order is #{@total}£"
  end
end