class Menu 

    attr_reader :dishes

    def initialize(dishes)
        @dishes = dishes
    end

    def print
        dishes.map do |dish, price| 
            '%s £%.2f' % [dish.to_s.capitalize, price]
        end.join(", ")
    end

    def has_dish?(dish_to_check)
      !dishes[dish_to_check].nil?  
    end

    def price(dish_to_check)
      dishes[dish_to_check]
    end
end