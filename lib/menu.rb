class Menu
    attr_reader :dishes

    def initialize
      @dishes = {
      "Cheeseburger" => 2.99,
      "Chicken burger" => 3.99,
      "Large fries" => 1.99,
      "Small fries" => 0.99,
      "Drink" => 0.89
      }
    end
  
    def dish_list
      @dishes.each { |d,c| puts "#{d}:   £#{c.to_f}" }
    end
  end
