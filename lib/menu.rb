class Menu
    attr_reader :menu 

    def initialize
        @menu = {"California Rolls" => 8, "Avocado Maki" => 7, "Edamame" => 3}
    end

    def print_menu
        puts "Menu      |      Price".center(50)
        puts "-----".center(50, '-')
        @menu.map do |item, price|
            print "#{item}".center(30)
            puts "#{price}".center(10)
        end
    end
end

