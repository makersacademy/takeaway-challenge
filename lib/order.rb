require "food"
class Order
    def initialize
        @basket = []
        @total = nil
    end
    def add_to_basket(food)
        @basket << food
    end
    def total
        count = 0
        fail "Basket empty" if @basket.length == 0
        @basket.each do |food|
            count += food.price
            puts food.name + ", £#{food.price}"
        end
        @total = count
        return "Your total is £#{count}"
    end
    def checkout
        # send text saying your order will be @total,delivered in time.now+1
    end
end