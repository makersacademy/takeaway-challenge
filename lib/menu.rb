require_relative 'send_sms'

class Menu

attr_reader :menu, :selection_of_dishes, :message
    
    def initialize
        @menu = {
            "lasagne" => 12,
            "oysters" => 14,
            "fries" => 4,
            "green_salad" => 9,
            "rump_steak" => 20,
            "tiramisu" => 25
        }
        @selection_of_dishes = []
        #@texter = SendText.new
    end

    def show_menu
        puts @menu
    end

    def order(dish, quantity = 1) #
        # For more interactivity, I could:
        # puts "Which dish(es) would you like to order?"
        # @selection_of_dishes = gets.chomp
        puts "#{quantity} x #{dish}(s) added to order."
        @selection_of_dishes << @menu.fetch(dish) * quantity
    end

    def total
        puts "The total of your order is £#{@selection_of_dishes.sum}."
    end

    def complete_order
        puts "Thank you for your order. You will receive message confirmation shortly."
        # return @send_message
    end

    # def send_sms(texter = @texter)
    #     texter.send_sms
    #   end

end