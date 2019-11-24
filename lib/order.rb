require './menu'
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
    @customer << "#{dish} x #{quantity}"
    @list_of_dishes.each { |key,value| key == dish ? @total += value * quantity : 0}
  end
  
  def show_order
    puts @customer
  end
  
  def price
    puts "#{@total}£"
  end
end