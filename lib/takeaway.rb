require 'order'
class Takeaway

    def initialize (food_list)
        @food_list = food_list
    end

    def print_dishes 
        @food_list.each {|key, value| puts "#{key} - £#{value}0" }
    end

    def total_order (order)
        total = 0 
        order.each do |key|
            total += @food_list[key]
        end
      total
    end
end