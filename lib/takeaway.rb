class Takeaway
    def menu
        @menu  = {
            "cheese" => 10,
            "pepperoni" => 12,
            "hawaiian" => 13,
            "vegetarian" => 13,
            "meat lovers" => 15
            }
    end 
    def print_menu
        menu 
        @menu.each do |key, value|
            puts "#{key} : #{value}"
        end  
    end 
end 