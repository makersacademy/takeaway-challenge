module DishToString
    def dish_to_string(dish)
        dish.to_s.gsub(/[_]/, ' ').split.map { |w| w.capitalize }.join(' ')
    end
end