class Takeaway

    def initialize(menu:)
        @menu = menu
    end

    def print_list
        menu.print    
    end

    private
    attr_reader :menu
end