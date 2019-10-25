require_relative 'item'

class Menu
    attr_reader :basket, :menu

    def initialize()
        @basket = []
        @menu = [Item.new("Pizza", 3.99), Item.new("Burger", 4.99), Item.new("Fries", 2.99)]
    end

    def AddToBasket(itemName)
        @menu.each do |item|
            @basket << item if item.name == itemName
        end
    end
end