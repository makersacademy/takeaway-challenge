
class OrderItem

attr_reader :dish_id, :quantity, :sub_total

    def initialize(dish_id, quantity, sub_total)
        @dish_id = dish_id
        @quantity = quantity
        @sub_total = sub_total
        
    end

    def sub_total
        @sub_total
    end
end
