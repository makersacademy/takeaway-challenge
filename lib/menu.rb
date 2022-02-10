require_relative '../lib/dishes'

class Menu

attr_reader :dish_class,

def initialize(:Dish)
    @dish_class = Dish
end

def select_dishes(name_of_dish)
    dish.each do |dish| dish.name = name_of_dish 
    end
end




