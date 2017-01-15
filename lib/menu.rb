require_relative 'dish_to_string'

class Menu
    
    include DishToString
    
    attr_reader :dishes
    
    def initialize(dishes_file = './lib/dishes.txt')
        @dishes = {}
        create_dishes_hash(dishes_file)
    end
    
    def print_dishes
        dish_list
    end
    
    def on_menu?(dish)
        dishes.include?(dish)
    end
    
    private
    
    def dish_list
        dish_list = ""
        dishes.each do |dish, price|
            price = price.to_s.gsub(/\d{2}\z/) { |m| '.' + m }
            dish_list << "#{dish_to_string(dish)} £#{price}, "
        end
        dish_list.gsub(/\W\s\z/, '.')
    end
    
    def create_dishes_hash(dishes_file)
        File.readlines(dishes_file).each do |line|
            line.scan(/^(\S*)\s(\d*)$/) do |dish, price|
                @dishes[dish.to_sym] = price.to_i
            end
        end
    end
end