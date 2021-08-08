require_relative 'menu'
require_relative 'takeaway'

class Order 

    attr_reader :current_order, :item

    def initialize 
        @current_order = []
    end

    def add_items(item)
        @current_order.append(item)
    end

    def print_order
        if current_order.length > 0
            @current_order.each.with_index(1) do |subhash, index|
                puts "#{index}. #{subhash[:item]}, #{subhash[:price]}"
            end
        else puts "No items added yet"
        end
    end

    def current_total
        total_array = []
        if current_order.length > 0
            @current_order.each do |subhash|
                total_array.append(subhash[:price])
            end
        puts "The current total is #{total_array.sum}"
        else puts "No items added yet"
        end
    end
end

