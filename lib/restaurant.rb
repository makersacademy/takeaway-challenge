class Restaurant
    
    attr_reader :menu
    
    def initialize (menu = Menu.new)
      @menu = menu
    end
    
    def show_menu
      @menu.show
    end
    
    def select_items(item, quantity) 
    end
end