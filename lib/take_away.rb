class TakeAway 

    attr_reader :menu, :dish, :food

    def initialize 
        @menu = { "Spring Rolls" => 4, 
                  "Won-Ton Soup" => 5,
                  "Chicken Fried Rice" => 5 
                }
        @food = []
    end


    def order(dish)
        @menu.each do |item, price|
            if dish == item
                @food << {item => price}
            end
        end
        return @food
    end

    def confirm
        total = 0
        @food.each do |item, price|
             total = total + price
        end
         puts "Your total is £#{total}."
    end
    
end