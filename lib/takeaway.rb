
class Takeaway 
attr_reader :menu, :payment

    def initialize
        @menu = { 'Salad'=>5, 'Pizza'=>8, 'Pasta'=>6 }
        @payment = 0
       
    end 

    def order(meal, quantity)
        quantity.times {order_basket << meal}
        if @menu.include?(meal)

          @payment = @payment + @menu[meal] * quantity
        
    end 
end 

    def order_basket
    
        @order_basket ||= []

    end 

    def total(sum)
        if sum == @payment
            puts 'the total is correct'
        else 
        raise 'the total does not match the sum' if sum != @payment
        end 
    end 
end 