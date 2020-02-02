require_relative 'menu'

class Basket
    attr_reader :basket, :menu, :total
    def initialize(menu = Menu.new)
        @menu = menu
        @basket = {}
        @total = nil
    end

    def add(item, quantity)
        @menu.menu.select { |dish, price| @basket[item] = quantity if dish == item }
    end

    def show_basket
        @basket
    end

    def total
        # work in progress
    end


end