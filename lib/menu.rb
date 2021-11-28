class Menu

attr_reader :menu, :selection_of_dishes
    
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
    end

    def show_menu
        puts @menu
    end

    def order(dish, quantity = 1) #
        # puts @list_of_dishes_with_prices
        # puts "Which dish(es) would you like to order?"
        # selection = gets.chomp
        puts "#{quantity} x #{dish}(s) added to order."
        @selection_of_dishes << @menu.fetch(dish) * quantity
    end

    def total
        puts "The total of your order is £#{@selection_of_dishes.sum}."
    end


end