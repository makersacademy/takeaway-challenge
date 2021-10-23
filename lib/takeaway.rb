class Takeaway
  
  attr_reader :menu

    def initialize(menu)
      @menu = menu
    end 

    def print_menu
      @menu.map { |key, value|
        "Dish: #{key} - Price: £#{value}"}.join(", ")
      end
      
    end 

