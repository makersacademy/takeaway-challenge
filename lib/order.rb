class Order
    attr_reader :menu, :basket

    def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    end

    def view
      @menu.dishes.each do | item |
        puts "#{item[0]}: £#{item[1]}"
      end
    end

    def add(dish, quantity)
        total_price = 0
        @menu.dishes.each do | item |
            if dish == item[0]
                total_price = item[1] * quantity
            end
        end
        fail 'Sorry this dish is not available' if total_price == 0
        @basket.push ([dish, quantity, total_price])
    end

    def total
        total_price = 0
        basket.each do |item|
            total_price += item[2]
        end
        return total_price
    end
end
