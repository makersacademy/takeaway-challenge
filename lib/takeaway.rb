require './lib/menu.rb'
class Takeaway
    attr_reader :menu, :read_menu
    def intialize(menu = Menu.new)
        @menu = menu
        @items = Hash.new(0)
    end
    def read_menu
        puts @menu
    end
    def order(dish, quantity = 1)
        @items[dish] += quantity
    end
    def basket_summary
        @items.each do |item, qty|
            puts "#{item} x #{qty} ordered"
        end
    end
    def price
      @price = {}
      @menu.each do |dish, price|
        @items.each do |item|
            if item == dish
                @price[item] = price
            end
        end
      end
    end
    def total_price
        total = 0
        @items.each do |item, qty|
            price = @price[item]
            qty_price = price*qty
            total += qty_price
        end
    end
    def total
        total_price
        puts "Total:  #{total}"
    end

end