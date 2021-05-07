require_relative 'menu'

class Takeaway

    attr_accessor :dishes

    def initialize(menu = Menu.new)
        @dishes = menu
    end

    def print_dishes
        @dishes.display
    end

end