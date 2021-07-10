
class Dish

attr_reader :name, :price    

    def initialize(name, price)
        @name = name
        @price = price  
    end

    def change_price(new_price)
        @price = new_price
    end

    def rename(new_name)
        @name = new_name
    end

end