
class Item
    attr_accessor :name, :price

    def initialize(name = nil, price = nil)
        @name = name
        @price = price
    end
end