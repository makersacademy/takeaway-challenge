class Order 
    attr_reader :dishes, :total

    def initialize(menuChoice_obj)
        @dishes = menuChoice_obj
        @total = 0
    end

    def sum
       @dishes.each do |item|
           @total += item[:price]
       end
       return @total
    end

    
end