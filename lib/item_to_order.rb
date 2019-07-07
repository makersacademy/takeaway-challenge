class ItemToOrder

attr_reader :order_details
attr_reader :dish_to_order
attr_reader :item_to_order

  def initialize(dish, quantity)
    @dish_to_order = dish
    @quantity = quantity
    @item_to_order
  end

  def order
    @item_to_order = { dish: @dish_to_order, quantity: @quantity}
  end

  def check_if_available(menu)
    raise 'Sorry this item is not available to order' if !menu.is_available?
  end


end
