require_relative 'takeaway'
class Order

  attr_reader :selected_dishes

  def initialize 
    @selected_dishes = []
    @total = []
  end 

  def add_dish(dish)
    @selected_dishes << dish
  end 

  def total
    menu = Takeaway.new.menu
    @selected_dishes.each { |item| @total << menu[item] } 
    @total.sum
  end 
  
end 