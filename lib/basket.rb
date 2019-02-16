class Basket
  attr_reader :basket_items
    def initialize
      @basket_items = []
    end

    def add_item(basket_item)
      @basket_items << basket_item
    end
end
