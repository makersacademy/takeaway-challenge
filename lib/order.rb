require './lib/menu'
require './lib/order_confirm'

class Order
    
    attr_reader :menu
    
    def initialize(menu = [])
        @menu = menu
        @order = []
    end
    
    def add_menu(menu)
        
        @menu = menu
        
    end
    
    def show_menu
        i = 1
        @menu.dishes.each do |item|
            puts "#{i}. #{item[:dish]} #{item[:price]}"
            i +=1
        end
    end
    
    def order(*chosen_dishes)
        chosen_dishes.each do |dish|
            if @order.include?(@menu.dishes[dish -1])
                index = @order.index(@menu.dishes[dish -1])
                @order[index][:quantity] +=1
            else
                @order << @menu.dishes[dish -1]
                @order[-1][:quantity] = 1
            end
        end
        @order
    end
    
    def total_bill
        total = 0
        @order.each {|dish| total += (dish[:price] * dish[:quantity])}
        total
    end
    
    def print_bill
        @order.each do |item|
            puts "#{item[:dish]} #{item[:quantity]} £#{item[:price] * item[:quantity]}"
        end
        puts "The total bill is £#{total_bill}"
    end
    
    def confirm_order(delivery_time = '1 hour', number)
        order_confirmation = OrderConfirm.new
        order_confirmation.get_msg("Your order comes to £#{total_bill} and will be with you in #{delivery_time}")
        order_confirmation.get_num(number)
        order_confirmation.send_confirm_msg
    end
    
end