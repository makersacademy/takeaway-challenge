require_relative('Menu')

class Order

    attr_reader :order_list, :item_count, :menu

    def initialize()
        @order_list = []
        @item_count = 0
        @menu = Menu.new
    end

    def pick_item(selection)
        item = @menu.menu_items[selection]
        add_item(item)
    end

    def add_item(item)
        @order_list.push(item)
        @item_count += 1
    end

    def list_order
        @order_list
    end    
    
end