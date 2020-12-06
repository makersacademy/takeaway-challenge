class Menu
    attr_reader :dishes
    
    def initialize
    @dishes = {
        "Pizza" => 7,
        "Burger" => 10,
        "Fish and Chips" => 9,
        "Beef Taco" => 5,
        "Ice-cream" => 3
    }
    end

    def see_menu
        print "Todays Menu Available for Delivery:\n"
        @dishes.each do |food, price| 
            puts "#{food} : £#{price}"
        end
    end
end