require_relative 'menu'

class Basket
    attr_reader :basket, :menu, :total
    def initialize(menu = Menu.new)
        @menu = menu
        @basket = {}
    end

    def add(item, quantity)
        @menu.menu.select { |dish, price| @basket[item] = quantity if dish == item }
    end

    def show_basket
        basket = []
        @basket.each { |item, quantity| basket << "#{item} x #{quantity}" }
        basket.join(", ")
    end

    def checkout
        checkout = []
        @basket.each { |item, quantity| checkout << @menu.menu[item] * quantity }
        "The total cost will be £#{checkout.sum}"
    end


end