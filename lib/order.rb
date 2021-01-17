class Order

    attr_reader :menu, :items

    def initialize(menu)
        @menu = menu
        @items = []
        @items_detail
        @total = 0
    end

    def add(dish)
        @items << dish
        @items[-1]
    end

    def open
        menu.list
        select
        confirm
    end

    def select
        puts "Enter number of dish to add to order. Enter empty to complete."
        while true do
            item = STDIN.gets.chomp
            break if item.empty?
            items << item.to_i
        end
    end

    def confirm
        summarise_order
        puts "Your order summary is as follows:"
        puts "---------------------------------"
        @items_detail.each do |key, item|
            puts "#{item[:qty]} x #{item[:name]}(#{key}) @ #{item[:price]} = £#{item[:subtotal]}"
        end
        puts "---------------------------------"
        puts "Total cost of order = £#{@total}"
    end

    def summarise_order
        items_counter = Hash.new(0)
        items.each { |item| items_counter[item] += 1 }
        @items_detail = {}
        @total = 0
        items_counter.each do |key, qty|
            dish_detail = lookup_dish_on_menu(key, qty)
            @items_detail[key] = dish_detail
            @total += dish_detail[:subtotal]
        end
        @total = @total.round(2)
    end

    def lookup_dish_on_menu(key, qty)
        dish_detail = {}
        menu.dishes.each do |dish_obj|
            if dish_obj.id == key
                dish_detail = {name: dish_obj.name, price: dish_obj.price, qty: qty, subtotal: (dish_obj.price * qty)}
            end 
        end
        dish_detail
    end
end