require_relative 'item'

class Menu
    def initialize
        @menu_items = []
        build_menu
        @basket = []
    end

    def build_menu
        item1 = Item.new(1, "Eggs and Turnips", 10)
        @menu_items.push(item1)
        item2 = Item.new(2, "Cheese, Carrot and Marzipan", 12)
        @menu_items.push(item2)
        item3 = Item.new(3, "Pear, Pork and Parmisan", 20)
        @menu_items.push(item3)
        item4 = Item.new(4, "Cabbage on Toast", 90)
        @menu_items.push(item4)
    end

    def view
        @menu_items.each { |item|
        puts "#{item.id}: #{item.name} £#{item.price}"
    }
    end

    def add_to_basket(item, quantity)
        @basket.push({item: @menu_items[item - 1], quantity: quantity})
    end

    def total
        total = 0
            @basket.each { |basket_item|
            total = total + (basket_item[:item].price * basket_item[:quantity])
        }
        return total
    end

    # def view_basket

    # end

end