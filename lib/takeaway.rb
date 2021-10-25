class Takeaway
  
  attr_reader :menu, :order, :dishes

    def initialize(menu)
      @menu = menu
      @dishes = []
    end 

    def print_menu
      @menu.map { |key, value|
        "Dish: #{key} - Price: £#{value}"}.join(", ")
      end

    def place_order(dish, num)
      @menu.each do |key, value|
        if dish == key
          puts "Dish selected: #{key} x #{num}"
        end  
      end 
    end 
    

  end 

