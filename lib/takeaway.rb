class Takeaway
attr_reader :menu
    def initialize(menu:)
        @menu = menu
    end

    def print
        @menu.print         #delegation
        "Here is a list of the dishes"
    end
end