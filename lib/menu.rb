class Menu
    attr_reader :menu_items

    def initialize
       @menu_items = { #create menu hash
           "Chips" => 2.00,
           "Pizza" => 24.00,
           "Chicken Kiev" => 3.00
       }
    end

    def print_menu
        @menu_items.each do |name, price| #get key and value in loop
            puts "#{name}: #{price}" #then print!
        end
    end

end