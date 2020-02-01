require "menu"
class Order
    def initialize
        @basket = []
    end
    def add_to_basket(food)
        @basket << food
    end
end