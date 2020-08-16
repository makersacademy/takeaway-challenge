require_relative 'menu'
require_relative 'order'

class Takeaway
    attr_reader :menu, :order, :food_list
    
    def initialize(menu= Menu.new)
        @menu = menu
        @total_price = 0
        @food_list = []
    end

    

    def pick(food, number)
        @menu.view
        new_order
        number.times { food_list.push(food => @menu[food])}
        @food_list

    end

    def new_order(order= Order.new)
        @order = order
    end

    def check_sum
       fail 'incorrect sum' if @order.sum(@food_list) != add

    end

     private
     def add
        @food_list.each { |hash| hash.each {|food, price| @total_price += price } }
        @total_price
     end
end
