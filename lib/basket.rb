class Basket
  attr_reader :basket_items
    def initialize(basket_item_class = BasketItem)
      @basket_items = []
      @basket_item_class = basket_item_class
    end

    def add_item(dish, dish_quantity)
      basket_item = @basket_item_class.new(dish, dish_quantity)
      @basket_items << basket_item
    end

    def remove_item(basket_item)
      @basket_items.delete(basket_item)
    end
end
