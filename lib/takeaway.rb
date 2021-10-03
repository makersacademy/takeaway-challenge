class TakeAway
MENU = [:burger, :pizza, :chips]
PRICE = [5, 4, 3]
    attr_accessor :item
    attr_accessor :dishlist

    def initialize
        @quantity = 0
        @price = 0
        @total_price = 0
        @order_summary = []
        @count = 0
    end 

    def see_menu
        MENU
    end

    def select(item, price, quantity)
        fail "Selected item not available. Please see menu." if !MENU.include?(item)
        @order_summary << "#{item} x#{quantity}"
        @total_price += (price * quantity)
    end

    def total_order
        "Order Summary: #{@order_summary[0]} Price Total: £#{@total_price}"
    end
end 