class Order

    attr_reader :dishes

    def initialize
        @dishes = {}
    end

    def add(dish, quantity)
        dishes[dish] = quantity

    end 

    #   def total
    #       dish.totals
    #   end 

    #  def dish_totals
    #  dishes.map do |dish, quantity|
    #          menu.price(dish) * quantity
    #          dishes.total
    #      end 
    # end 
end 