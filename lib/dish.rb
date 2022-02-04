require "./lib/menu.rb"

class Dish

    attr_reader :name, :price

    def initialize(name = 'Default' , price = 0.00)
        @name = name
        @price = price
    end

end