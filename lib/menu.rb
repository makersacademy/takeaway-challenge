class Menu

    attr_reader :menu_items

    def initialize()
        @menu_items = [
        {name: 'Burger', price: 1, available: true},
        {name: 'Curry', price: 2, available: true },
        {name: 'Nandos', price: 3, available: true},
        {name: 'Wagamamas', price: 4, available: true}
      ]
    end

    def add_dish(dish)
        @menu_items.push(dish)
    end

    def list_menu
        @menu_items
    end
        

end