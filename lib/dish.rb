class Dish

    attr_reader :price, :name

    def initialize(name="Dish", price=0)
        @name = name
        @price = price
    end

end