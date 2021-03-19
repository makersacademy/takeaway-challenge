require_relative 'menu.rb'

class Takeaway
    attr_reader :menu

    def initialize(menu = Menu.new)
        @menu = menu
    end
    
    def read_menu
        menu.printed_menu
    end
end