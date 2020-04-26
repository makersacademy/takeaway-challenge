class Restaurant
    
    attr_reader :menu, :order
    
    def initialize (menu = Menu.new, order = CustomerSelection.new)
      @menu = menu
      @order = order
    end
    
    def show_menu
      @menu.show
    end
    
    def select_items(item, quantity) 
      @order.add(item, quantity)
    end
    
    def summary 
      @order.print_order
    end
    
    def checkout(amount)
      raise "Amount does not equal bill total" if amount != @order.total
      "Order confirmed!"
    end
end