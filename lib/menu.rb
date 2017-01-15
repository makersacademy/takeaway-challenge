class Menu

    attr_reader :dishes
    
    def initialize(dishes_file = './lib/dishes.txt')
        @dishes = {}
        create_dishes_hash(dishes_file)
    end
    
    def print_dishes
        dish_list = ""
        dishes.each do |dish, price|
            dish = dish.to_s.gsub(/[_]/, ' ').split.map { |w| w.capitalize }.join(' ')
            price = price.to_s.gsub(/\d{2}\z/) { |m| '.' + m }
            dish_list << "#{dish} £#{price}, "
        end
        dish_list.gsub(/\W\s\z/, '.')
    end

    private
    
    def create_dishes_hash(dishes_file)
        File.readlines(dishes_file).each do |line|
            line.scan(/^(\S*)\s(\d*)$/) do |dish, price|
                @dishes[dish.to_sym] = price.to_i
            end
        end
    end
end