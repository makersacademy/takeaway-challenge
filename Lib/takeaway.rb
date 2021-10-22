

class Takeaway
    
    attr_reader :dishes
    # An attribute reader returns the value of an instance variable.

    def intialize(dishes = Hash.new )
        @dishes = dishes 
    end 

    def dish
        dishes = { "topokki" => 10, "rice" => 5, "Kimchi" => 5,  "Bibimbap" => 15 }
    end 
end 