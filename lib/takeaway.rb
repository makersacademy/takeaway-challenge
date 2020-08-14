
class Takeaway 
attr_reader :menu

    def initialize
        @menu = { 'Salad'=>5, 'Pizza'=>8, 'Pasta'=>6 }
        @order_basket = []
    end 

    def order(meal_name, quantity)
        quantity.times {order_basket << meal_name}
        if @menu.key?(meal_name)
        end 
    end 

    def order_basket
    
        @order_basket = ['Salad', 'Salad']

    end 

end 
