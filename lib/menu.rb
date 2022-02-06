require 'dish'

class Menu

  attr_accessor :dishes

  def initialize
    @dishes = []
  end  

  def load
    @dishes.push(Dish.new("Sweetcorn Patties", 3.99))
    @dishes.push(Dish.new("Thai Red Curry (King Prawn)", 6.99))
    @dishes.push(Dish.new("Thai Red Curry (Vegetable)", 5.99))
    @dishes.push(Dish.new("Singapore Noodles (Vegetable)", 4.99))
    @dishes.push(Dish.new("Steamed Rice", 2.99))
  end
  
  def show_menu
    @dishes.each do |dish|
      puts "#{dish.name} #{dish.price}"
    end    
  end  
end 
