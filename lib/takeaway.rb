require_relative 'menu'

class Takeaway

    def view_menu(menu = Menu.new)
        @menu = menu
        menu.print_menu
    end

end