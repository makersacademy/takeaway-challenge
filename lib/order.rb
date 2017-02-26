class Order
  attr_reader :basket

    def initialize
      @basket = {}
    end

    def add_to_basket(dish, quantity)
      # fail "#{dish} isn't on our menu." if off_menu?
      @basket[dish] = quantity
      return "#{quantity}x #{dish} has been added to your basket."
    end

    #
    # def total
    #
    # end
end
