require_relative 'menu'
require_relative 'order'

class Takeaway
    attr_reader :menu, :order
    
    def initialize(menu= Menu.new)
        @menu = menu
        @total_price = 0
        @food_list = []
    end

    def pick
        @menu.view
        new_order
        #if it comes to it ask user for input
        # array.push({:Burger => 5.00})
    end

    def new_order(order= Order.new)
        @order = order
    end

    def check_sum
       fail 'incorrect sum' if @order.sum != add
    end

     private
     def add
        @food_list.each { |hash| hash.each {|food, price| @total_price += price } }
        @total_price
     end
end
