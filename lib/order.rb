require_relative 'menu'

class Order
    
    attr_accessor :basket
    
    def initialize
        @basket = []
    end
    
    def selection (order, number)
        @basket.push(order,number)
    end
    
end