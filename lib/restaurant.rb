require_relative 'menu'

class Restaurant

    def initialize(menu: Menu.new('./lib/dishes.txt'))
        @menu = menu
    end
    
    def show_menu
        menu.print_dishes
    end
    
    private
    
    attr_reader :menu
end