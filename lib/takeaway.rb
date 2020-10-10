require_relative 'menu'

class Takeaway

    def initialize(menu = Menu.new)
        @menu = menu
    end

    def view_menu
        @menu.print_menu
    end

end