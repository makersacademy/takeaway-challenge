class Basket
  attr_reader :basket_items
  def initialize(basket_item_class = BasketItem)
    @basket_items = []
    @basket_item_class = basket_item_class
  end

  def add_item(dish, dish_quantity = 1)
    basket_item = @basket_item_class.new(dish, dish_quantity)
    @basket_items << basket_item
  end

  def remove_item(dish)
    index = @basket_items.find_index { |each_basket_item| each_basket_item.dish == dish }
    @basket_items.delete_at(index)
  end

  def basket_total_price
    basket_total = 0.00
    @basket_items.each { |basket_item| basket_total += basket_item.dish_total_price }
    basket_total
  end

end
