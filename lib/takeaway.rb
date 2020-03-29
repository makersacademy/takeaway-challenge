require 'order'
class Takeaway
    def initialize (food_list)
        @food_list = food_list
    end

    def print_dishes 
        @food_list.each {|key, value| puts "#{key} - £#{value}0" }
    end
end