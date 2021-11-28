class Menu

attr_reader :list_of_dishes_with_prices
    
    def initialize
        @list_of_dishes_with_prices = [
            {lasagne: 12},
            {oysters: 14},
            {hamburger: 10},
            {fries: 4},
            {green_salad: 9},
            {rump_steak: 20},
            {roast_chicken: 18}
        ]
    end

    def show_menu
        puts list_of_dishes_with_prices
    end

end