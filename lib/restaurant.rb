class Restaurant 

    attr_reader :menu

    def initialize
        @menu = [{10 => "Pad Thai"}, {11 => "Massaman Curry"}, {5 => "Crispy Squid"}, {3 => 'Jasmine Rice'} ]    
    end

    def display
        puts 'Welcome to Thai mi Shoes'
        puts @menu
        puts 'to order please enter the line number of the menu starting from 0'
    end

end
