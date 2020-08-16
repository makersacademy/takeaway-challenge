
class Menu
    attr_reader :menu 

    def initialize
        @menu = {"Burger" => 5.00, "Pizza" => 4.00, "Fish" => 6.00, "Chicken" => 5.00}
    end
    
    def view
      puts @menu
     
    end

   
end