class Menu

    attr_reader :dishes
    
    def initialize(dishes_file)
        @dishes = {}
        create_dishes_hash(dishes_file)
    end
    
    def print_dishes
        dish_list = ""
        dishes.each do |meal, price|
            meal = meal.to_s.gsub(/[_]/, ' ').split.map { |w| w.capitalize }.join(' ')
            price = price.to_s.gsub(/\d{2}\z/) { |m| '.' + m }
            dish_list << "#{meal} £#{price}, "
        end
        dish_list.gsub(/\W\s\z/, '.')
    end

    private
    
    def create_dishes_hash(dishes_file)
        File.readlines(dishes_file).each do |line|
            line.scan(/^(\S*)\s(\d*)$/) do |meal, price|
                @dishes[meal.to_sym] = price.to_i
            end
        end
    end
end