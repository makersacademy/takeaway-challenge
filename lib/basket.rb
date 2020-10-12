require_relative 'menu'

class Basket

    def initialize(menu = Menu.new.menu)
      @menu = menu
      @basket = []
      @order_total = 0
    end

    def basket
      @basket
    end

    def order_total
      @order_total
    end

    def add_to_basket(item, quantity)
      if valid_item?(item)
        @basket << {item => quantity}
        @order_total += @menu[item] * quantity
      else raise "Not a valid item, please select again"  
      end
    end

    private

    def valid_item?(item)
        menu = Menu.new.menu
        menu.has_key?(item)
    end
        

end