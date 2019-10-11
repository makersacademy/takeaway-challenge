class Order 
    attr_reader :menu, :basket
    
    def initialize(menu = Menu.new) 
    @menu = menu
    @basket = []
    end
    
    def view
      @menu.dishes.each do | item, price |
        puts "#{item}: £#{price}"
      end   
    end

    def add(dish, quantity)
        total_price = 0
        @menu.dishes.each do | item, price |
            if dish == item
                total_price = price * quantity
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

