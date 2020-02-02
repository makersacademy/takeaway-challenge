require "menu"
class Order
    def initialize
        @basket = []
    end
    def add_to_basket(food)
        @basket << food
    end
    def total
        count = 0
        fail "Basket empty" if @basket.length == 0
        @basket.each do |food|
            count += food.price
            puts food.name +", £#{food.price}"
        end
        puts "Your total is £#{count}"
    end

        
end