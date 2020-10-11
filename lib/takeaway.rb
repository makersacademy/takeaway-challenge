class Takeaway

    def initialize
        @menu = {
        "1. Double Double" => 4.35,
        "2. Cheeseburger" => 3.15,
        "3. Hamburger" => 2.85,
        "4. French Fries" => 2.05,
        "5. Milkshake" => 2.45,
        "6. Small Soda" => 1.75
         }
         @basket = []
    end

    def menu
        @menu
    end

    def basket
        @basket
    end

    def order(menu)
        puts 'please select as many items as you would like to put in your cart by typing the number of the item listed'
        item = gets.chomp
        @basket << item
        while item != "" do
            print(menu)
            puts 
        @basket << item
        end
    end

    def print(menu)

        menu.each do |key, value|
            puts key + ": " + "$#{value}"
        end

    end

end