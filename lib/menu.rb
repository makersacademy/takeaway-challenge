class Menu

    attr_reader :items

    def initialize
        @items = {"Chips" => 40, 
        "Fries" => 45,
        "Wedges" => 43,
        "Potato Waffles" => 100,
        "Croquettes" => 100,
        "Baked Potato" => 600,
        "Taytos Crisps (Ready Salted)" => 25,
        "Smash Ice Cream" => 100,
        "Poitin (100ml)" => 1
    }
    end

    def print_menu
        items_array = @items.map.with_index(1) { |(dish, price), index| "#{index}. #{dish} - £#{price}" }
        puts items_array.join("\n")
    end 
end

class Order

    attr_reader :order_hash

    def initialize(menu)
        @order_hash = {}
        @items = menu.items
    end

    def select_item(item_number, quantity)
        dish = @items.keys[item_number - 1]
        @order_hash[dish] = quantity
    end
    ## Way to add same item twice without if loop?
end


class Summary

    attr_reader :order_hash
    attr_reader :items

    def initialize(menu, order)
        @items = menu.items
        @order_hash = order.order_hash
    end

    def total_cost
        counter = 0
        @order_hash.each { |dish, amount| counter += @items[dish] * amount }
        counter
    end

    def print_order
        order_array = @order_hash.map { |dish, amount| "#{dish} x #{amount} - £#{@items[dish] * amount}" }
        puts order_array.join("\n")
        puts "Total: £#{self.total_cost}"
    end

end

# class Checkout

#     def initialize
#     end

# end


# menu = Menu.new
# menu.print_menu
# order = Order.new(menu)
# order.select_item(1,3)
# order.select_item(2,3)
# order.select_item(1,1)
# summary = Summary.new(menu, order)
# summary.print_order


