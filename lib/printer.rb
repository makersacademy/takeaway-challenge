module Printer
    def show_price
        check_arr = []
        user_order.each_pair do |key, value|
            multiple = value[0] * value[1]
            check_arr.push multiple
        end
        @total_price = check_arr.inject(0) { |x, y| x + y }
    end

    def show_order_list
        user_order.each_pair do |key, value|
            puts "#{value[0]} #{key} price: #{value[0] * value[1]}"
        end
        "Total: #{@total_price}"
    end
end
