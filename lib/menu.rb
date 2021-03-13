class Menu
  attr_accessor :pizzas
  def initialize 
    @pizzas = {
                "cheese" => 10,
                "pepperoni" => 12,
                "hawaiian" => 13,
                "vegetarian" => 13,
                "meat" => 15 }
  end 

  def print_menu
    @pizzas.each do |key, value|
        puts "#{key} : #{value}"
    end  
  end 
end 
