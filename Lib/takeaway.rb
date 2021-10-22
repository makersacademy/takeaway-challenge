

class Takeaway
    
    # attr_reader :menu 
    # # An attribute reader returns the value of an instance variable.

    # def intialize(menu = Hash.new )
    #     @menu = menu 
    # end 

    # def dish
    #     menu = { "topokki" => 10, "rice" => 5, "Kimchi" => 5,  "Bibimbap" => 15 }
    # end 

    # def selecting_meal 


    # end 

    def initialize(menu:) # depedency injection in ruby 
        @menu = menu 
    end 

    def get_menu 
        menu.print
    end 

    private 

    attr_reader :menu 

end 