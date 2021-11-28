class Menu

attr_reader :list_of_dishes_with_prices, :selection_of_dishes
    
    def initialize
        @list_of_dishes_with_prices = {
            "lasagne" => 12, #I need to include a number for order method.
            "oysters" => 14,
            "fries" => 4,
            "green_salad" => 9,
            "rump_steak" => 20,
            "tiramisu" => 25
        }
        @selection_of_dishes = []
    end

    def show_menu
        puts list_of_dishes_with_prices
    end

    def order(dish, quantity = 1) #
        # puts @list_of_dishes_with_prices
        # puts "Which dish(es) would you like to order?"
        # selection = gets.chomp
        puts "#{quantity} x #{dish}(s) added to order."
        @selection_of_dishes << @list_of_dishes_with_prices.fetch(dish) * quantity
    end

    def total
        puts "The total of your order is £#{@selection_of_dishes.sum}."
    end


end