class Basket
  attr_reader :basket_items
    def initialize
      @basket_items = []
    end

    def add_item(basket_item)
      @basket_items << basket_item
    end

    def remove_item(basket_item)
      @basket_items.delete(basket_item)
    end
end
