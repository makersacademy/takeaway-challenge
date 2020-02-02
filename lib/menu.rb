class Menu
    attr_reader :menu
    MENU = { "pizza" => 10, "pasta" => 8, "chips" => 3, "burger" => 7, "milkshake" => 5 }
    
    def initialize
        @menu = MENU
    end

end