class Menu
    attr_reader :dishes
 
    def initialize(dishes)
      @dishes = dishes
    end
 
    def print
      dishes.map do |dish, price|
        [dish.to_s, price]
      end.join(", ")
    end
    def has_dish?(dish)
        !dishes[dish].nil?
    end
  end



  
