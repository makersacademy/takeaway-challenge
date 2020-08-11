class Menu 
    attr_reader :dishes

    def initialize(dishes)
      @dishes = dishes 
    end 

    def print
      dishes.map do |key, value| 
        "%s £%.2f" % [key.to_s.capitalize, value]
        end.join(', ')
    end

end 