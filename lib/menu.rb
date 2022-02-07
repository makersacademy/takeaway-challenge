class Menu

  attr_accessor :dishes

  def initialize
    @dishes = {}
  end  

  def load
    @dishes = {"Sweetcorn Patties": 3.99, "Thai Red Curry (King Prawn)": 6.99, "Thai Red Curry (Vegetable)": 5.99, "Singapore Noodles (Vegetable)": 4.99, "Steamed Rice": 2.99}
  end
  
  #def show_menu2
  #  puts @dishes2
  #  puts @dishes2.length
  #  @dishes2.each do |dish, price|
  #    puts "#{dish.to_s} #{price}"
  #end  
    # @dishes.each do |items|
    #  puts "#{}. #{items.Name} #{dish.price}"
    # end    
  #end  
end 
